function [U,P]=do_transmission_ana(t,U0,P0,beta,ttype)
% USAGE: [U,P]=do_transmission_ana(t,U0,P0,beta,ttype)
%
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   started:       8 August 2019
%   last updated: 21 March 2021
%
% Analytic forms of the number of unpartnered (U) and partnered (P)
% individuals across many nodes (x locations) in a system with infection at
% rate beta with one of the following transmission dynamics:
%   (i) density-dependent transmission
%     dy=[- beta*U*P;
%           beta*U*P];
%   (ii) frequency-dependent tranmission
%     dy=[- beta*U*P/(U+P);
%           beta*U*P/(U+P)];
%
% INPUTS:
%   t = amount of time to run dynamics for
%   U0 = starting number of unpartnered hosts
%   P0 = starting number of partnered hosts
%   beta = infection rate
%   ttype = transmission: density-dependent (0) or frequency-dependent (1)
%
% OUTPUTS:
%   U = ending number of unpartnered hosts
%   P = ending number of partnered hosts

N = U0+P0;

if beta==0
    U = U0;
    P = P0;
    
elseif ttype==0 % density-dependent transmission
    
    U =  N.*U0.*exp(-beta*N*t) ./ ( U0.*exp(-beta.*N.*t) + P0 );
    P = P0.*N                  ./ ( U0.*exp(-beta.*N.*t) + P0 );
    
elseif ttype==1 % frequency-dependent transmission
    
    U = U0.*N ./ ( U0 + P0.*exp( beta.*t) );
    P = P0.*N ./ ( P0 + U0.*exp(-beta.*t) );
    
else
    error('unknown transmission mode')
end

%find place where initial partnered individuals were zero and reset
ind = find(P0==0);
P(ind)=P0(ind);
U(ind)=U0(ind);

end