% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 13 January 2022
% takes ~5 hours to run

clear all

%-----PARAMETERS----------------------------------------------------------%
    tau1 = 0.5;   % fraction of year to run transmission for
    surv_U = 0.7; % survival probability of unpartnered hosts
    phi_U = 0.8;    % fecundity of unpartnered hosts
    b = 1;          % density-dependence parameter
    v_U = 0.25;     % dispersal variance of unpartnered hosts
    ngens = 150;    % number of generations
    cmax = 1-surv_U-0.05; % maximum change in survival that is bioloically feasible
    nvec = linspace(-cmax,cmax,21); % net effect of symbiont (n<1 parasite, n>1 mutualist)
    %-----PARAMETERS----------------------------------------------------------%

betavec = fliplr(linspace(0.5,2.5,21));    % transmission rate (density-dependent) [per ind per year]
a = 0;       % Allee threshold
v_P = v_U;   % dispersal variance of partnered hosts
h = []; % half-saturating constant for type II transmission
ttype = 1;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)

for ii = 1:length(betavec)
    beta = betavec(ii);    % transmission rate (density-dependent) [per ind per year]
    
    for i = 1:length(nvec)
        n = nvec(i)
        
        % SURVIVAL COST
        stype = 1; % whether symbiont affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_FD1(ii,i) = speed_inst(end);
        
        % FECUNDITY COST
        stype = 2; % whether cost affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_FD2(ii,i) = speed_inst(end);
        
    end
end

save fig4_beta.mat *
%%
clear all
%-----PARAMETERS----------------------------------------------------------%
    tau1 = 0.5;   % fraction of year to run transmission for
    surv_U = 0.7; % survival probability of unpartnered hosts
    phi_U = 0.8;  % fecundity of unpartnered hosts
    b = 1;        % density-dependence parameter
    v_U = 0.25;   % dispersal variance of unpartnered hosts
    ngens = 150;  % number of generations
    cmax = 1-surv_U-0.05; % maximum change in survival that is bioloically feasible
    nvec = linspace(-cmax,cmax,21); % net effect of symbiont (n<1 parasite, n>1 mutualist)
%-----PARAMETERS----------------------------------------------------------%

beta = 2;    % transmission rate (density-dependent) [per ind per year]
a = 0;          % Allee threshold
vivec = fliplr(linspace(0.1,1,19))*v_U;   % dispersal variance of infecteds
h = []; % half-saturating constant for type II transmission
ttype = 1;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)

for ii = 1:length(vivec)
    v_P = vivec(ii);  % dispersal variance of infecteds
        
    
    for i = 1:length(nvec)
        n = nvec(i);
        
        % SURVIVAL COST
        stype = 1; % whether symbiont affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_FD1(ii,i) = speed_inst(end);
        
        % FECUNDITY COST
        stype = 2; % whether symbiont affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_FD2(ii,i) = speed_inst(end);
        
    end
end

save fig4_v.mat *
%%
clear all

%-----PARAMETERS----------------------------------------------------------%
    tau1 = 0.5;   % fraction of year to run transmission for
    surv_U = 0.7; % survival probability of unpartnered hosts
    phi_U = 0.8;  % fecundity of unpartnered hosts
    b = 1;        % density-dependence parameter
    v_U = 0.25;   % dispersal variance of unpartnered hosts
    ngens = 150;  % number of generations
    cmax = 1-surv_U-0.05; % maximum change in survival that is bioloically feasible
    nvec = linspace(-cmax,cmax,21); % net effect of symbiont (n<1 parasite, n>1 mutualist)
%-----PARAMETERS----------------------------------------------------------%

beta = 2;    % transmission rate (density-dependent) [per ind per year]
avec = linspace(0,1,21);    % allee threshold
v_P = v_U;  % dispersal variance of infecteds
h = []; % half-saturating constant for type II transmission
ttype = 0;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)

for ii = 1:length(avec)
    a = avec(ii)    % allee threshold
    
    for i = 1:length(nvec)
        n = nvec(i);
        
        % SURVIVAL COST
        stype = 1; % whether symbiont affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_DD1(ii,i) = speed_inst(end);
        
        % FECUNDITY COST
        stype = 2; % whether symbiont affects survival (1) or fecundity (2)
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        [~,~,~,speed_inst,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_DD2(ii,i) = speed_inst(end);
        
    end
end

save fig4_AE.mat *