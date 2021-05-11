function [x,U,P,speed_inst,popedge,popedge_P] = run_simulation(ngens,ttype,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P)
% USAGE: [x,U,P,speed_inst,popedge,popedge_P] = run_simulation(ngens,ttype,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P)
%
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   started:      31 July 2019
%   last updated: 21 March 2021
%
% Simulates a host population with unpartnered (U) and partnered (P)
%   individuals that is spreading out across space.
%
% INPUTS:
% ngens = number of generations
% ttype = transmission: density-dependent (0) or frequency-dependent (1)
% beta = transmission rate (density-dependent) [per ind per gen]
% tau1 = fraction of year to run transmission for
% surv_U = survival probability of unpartnered hosts
% surv_P = survival probability of partnered hosts
% phi_U = fecundity of unpartnered hosts
% phi_P = fecundity of partnered hosts
% a = allee threshold
% b = density-dependence parameter
% v_U = dispersal variance of unpartnered hosts
% v_P = dispersal variance of partnered hosts

% OUTPUTS:
% x = location of population points
% U = density of unpartnered hosts over time and space
% P = density of partnered hosts over time and space
% speed_inst = instantaneous spread rate of population (U and P together)
% popedge = x location of the right-most edge of the total population for
%        each gen
% popedge_P = x location of the right-most edge of the furthest P for
%        each gen

eps1 = 1e-15;    % threshold for a 'zero' population density
ncrit = 0.001;   % threshold for the edge of the population

nodes = (2^15)+1;      % number of nodes/bins to have in the domain (2^m + 1)
diameter = 700;        % length of domain/space to simulate across
radius = diameter/2;

% set up 1-D spatial domain
x = linspace(-radius,radius,nodes);          % vector of node locations
x2 = linspace(-diameter,diameter,2*nodes-1); % vector of node locations, extended domain
dx = diameter/(nodes-1);                     % distance between nodes

% matrix to store population densities over time
U = zeros(ngens+1,length(x)); % unpartnered hosts
P = zeros(ngens+1,length(x)); % partnered hosts

%set up initial conditions
IC_rad = 0.1; % radius of initial population
IC_Udens = 6;  % density of initial unpartnered hosts
IC_Pdens = 2;  % density of initial partnered hosts
temp = find(abs(x) <= IC_rad);
U(1,temp) = IC_Udens*ones(size(U(1,temp))); % set initial conditions
P(1,temp) = IC_Pdens*ones(size(P(1,temp))); % set initial conditions
clear temp

popedge = NaN(ngens+1,1);
popedge_P = NaN(ngens+1,1);
speed_inst = NaN(ngens,1);

% dispersal kernel
kU = exp(-sqrt((2*(x2).^2)/v_U))./sqrt(2*v_U);
kP = exp(-sqrt((2*(x2).^2)/v_P))./sqrt(2*v_P);

for i = 1:ngens
    
    U0 = U(i,:);
    P0 = P(i,:);

    % [1] first transmission
    % only consider places with a nonzero pop
    ind = find(U0+P0 > eps1);
    Utrim = U0(ind);
    Ptrim = P0(ind);
    % get U and P analytically
    [Uout,Pout] = do_transmission_ana(tau1,Utrim,Ptrim,beta,ttype);
    % plug these transmission outputs back into the full pop context
    U1 = U0; U1(ind) = Uout;
    P1 = P0; P1(ind) = Pout;
    clear Utrim Ptrim Uout Pout
    
    % [2] survival
    U2 = surv_U*U1;
    P2 = surv_P*P1;
    
    % [3] reproduction
    ntot = U2 + P2;
    g = b./(b+ntot); % strength of density dependence
    g(ntot<a) = 0;     % account for Allee effect
    U3 = U2 + (phi_U*U2+phi_P*P2).*g;
    P3 = P2;
        
    % [4] dispersal
    % calculate convolutions
    Ux = fft_conv(kU,U3);
    Px = fft_conv(kP,P3);
    % convert to population density
    U4 = dx*Ux(nodes:length(x2));
    P4 = dx*Px(nodes:length(x2));
    % fix ends
    U4(1) = U4(1)/2;
    U4(nodes) = U4(nodes)/2;
    P4(1) = P4(1)/2;
    P4(nodes) = P4(nodes)/2;
    % set any densities that are too low to zero
    temp = find(U4 < eps1);
    U4(temp) = zeros(size(U4(temp)));
    temp = find(P4 < eps1);
    P4(temp) = zeros(size(P4(temp)));
    clear temp
    
    U(i+1,:) = U4;
    P(i+1,:) = P4;
    
    % reset temporary density vectors
    U0(:) = 0; P0(:) = 0;
    U1(:) = 0; P1(:) = 0;
    U2(:) = 0; P2(:) = 0;
    U3(:) = 0; P3(:) = 0;
    U4(:) = 0; P4(:) = 0;
        
    % overall population size
    N = U(i+1,:) + P(i+1,:);
    % find the edge of the total population
    jj = find(N >= ncrit,1,'last');
    % if there is a population edge
    if ~isempty(jj)
        % interpolate to get the location
        popedge(i+1) = interp1(N(jj:jj+1),x(jj:jj+1),ncrit);
    end
    speed_inst(i) = popedge(i+1)-popedge(i);
    
    % find the edge of partnered hosts
    jj = find(P(i+1,:) >= ncrit,1,'last');
    % if there is a population edge
    if ~isempty(jj)
        % interpolate to get the location
        popedge_P(i+1) = interp1(P(i+1,jj:jj+1),x(jj:jj+1),ncrit);
    end
    
end
