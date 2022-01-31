clear all; close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 18 January 2022
% takes ~45 minutes to run

%-----PARAMETERS----------------------------------------------------------%
    beta = 2;     % transmission rate (density-dependent) [per ind per year]
    tau1 = 0.5;   % fraction of year to run transmission for
    surv_U = 0.7; % survival probability of unpartnered hosts
    phi_U = 0.8;    % fecundity of unpartnered hosts
    a = 0;          % Allee threshold
    b = 1;          % density-dependence parameter
    v_U = 0.25;     % dispersal variance of unpartnered hosts
    v_P = 0.25;     % dispersal variance of partnered hosts
    ngens = 150;    % number of generations
    cmax = 1-surv_U-0.05; % maximum change in survival that is bioloically feasible
    nvec = linspace(-cmax,cmax,21); % net effect of symbiont (n<1 parasite, n>1 mutualist)
    hvec = [0 0.05 0.1 0.2 0.5 1 10]; % half-saturating constant for type II transmission
%-----PARAMETERS----------------------------------------------------------%

for stype = 1:2 % whether symbiont affects survival (1) or fecundity (2)
    
    for i = 1:length(nvec)
        n = nvec(i)
        
        if stype == 1   % symbiont affects survival (1)
            surv_P = surv_U + n;
            phi_P = phi_U;
        elseif stype == 2 % symbiont affects fecundity (2)
            surv_P = surv_U;
            phi_P = phi_U + n;
        end
        
        ttype = 0;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)
        h = []; % half-saturating constant for type II transmission
        [~,~,~,speed_inst,popedge,popedge_P] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_DD(i) = speed_inst(end);
        edge_DD(i,:) = popedge;
        edge_P_DD(i,:) = popedge_P;
        clear popedge popedge_P
        
        ttype = 1;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)
        h = []; % half-saturating constant for type II transmission
        [~,~,~,speed_inst,popedge,popedge_P] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
        speed_FD(i) = speed_inst(end);
        edge_FD(i,:) = popedge;
        edge_P_FD(i,:) = popedge_P;
        clear popedge popedge_P
        
        ttype = 2;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)
        for ii = 1:length(hvec)
            h = hvec(ii);
            [~,~,~,speed_inst,popedge,popedge_P] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
            speed_type3(ii,i) = speed_inst(end);
            edge_type3(ii,i,:) = popedge;
            edge_P_type3(ii,i,:) = popedge_P;
            clear speed_inst popedge popedge_P
        end
        clear ttype h

        
    end
    clear n i speed_inst
    save(strcat(['fig3_stype=' num2str(stype) '.mat']))
    clear speed_DD edge_DD edge_P_DD speed_FD edge_FD edge_P_FD
    
end

