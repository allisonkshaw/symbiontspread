clear all; close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 24 January 2022

%-----PARAMETERS----------------------------------------------------------%
    beta = 2;    % transmission rate (density-dependent) [per ind per year]
    tau1 = 0.5;      % fraction of year to run transmission for
    surv_U = 0.7; % survival probability of unpartnered hosts
    phi_U = 0.8;    % fecundity of unpartnered hosts
    b = 1;          % density-dependence parameter
    a = 0;          % Allee threshold
    v_U = 0.25;     % dispersal variance of unpartnered hosts
    v_P = 0.25;     % dispersal variance of partnered hosts
    ngens = 150;    % number of generations
    stype = 1; % whether symbiont affects survival (1) or fecundity (2)
    ttype = 2;  % transmission: density-dependent (0) or frequency-dependent (1) or type II function (2)
%-----PARAMETERS----------------------------------------------------------%

cmax = 1-surv_U-0.05; % maximum change in survival that is bioloically feasible
nvec = linspace(-cmax,cmax,11); % net effect of symbiont (n<1 parasite, n>1 mutualist)
i = 3;
n = -0.15
if stype == 1   % symbiont affects survival (1)
    surv_P = surv_U + n;
    phi_P = phi_U;
elseif stype == 2 % symbiont affects fecundity (2)
    surv_P = surv_U;
    phi_P = phi_U + n;
end


h = 0.1; % half-saturating constant for type II transmission
[x_h1,U_h1,P_h1,~,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);
h = 1; % half-saturating constant for type II transmission
[x_h2,U_h2,P_h2,~,~,~] = run_simulation(ngens,ttype,h,beta,tau1,surv_U,surv_P,phi_U,phi_P,a,b,v_U,v_P);


ncrit = 0.001

fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
fs4 = 08;  % tiny numbering
lw2 = 1; % fig edges
lw1 = 1.5; % fig edges


width = 15;
height = 10;
xpos = 3;
ypos = 2;
sx = 0.12;
sy = 0.08;
w = 0.35;
he = 0.24;
dy = 0.08;
dx = 0.15;

g1 = [0 0 0]; % black
%g1 = [0.2 0.2 0.2]; % dark grey
g3 = [0.5 0.5 0.5]; % med grey
g4 = [0.9 0.9 0.9]; % pale grey

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

xmax = 50;
ind = [100 50 1];

for i = 1:length(ind)
    axes('position',[sx sy+(i-1)*(dy+he) w he])
    hold on
    plot(x_h1,U_h1(ind(i),:),'color',g1,'LineWidth',lw1);
    plot(x_h1,P_h1(ind(i),:),'color',g3,'LineWidth',lw1);
    box on
    xlim([-xmax xmax])
    if i < 3
        N_h1 = U_h1(ind(i),:)+P_h1(ind(i),:);
        xvals = x_h1(N_h1>ncrit & P_h1(ind(i),:)<ncrit);
        xvals_neg = xvals(xvals<0);
        xvals_pos = xvals(xvals>0);
        h=fill([xvals_neg fliplr(xvals_neg)],[zeros(size(xvals_neg)) 1.48*ones(size(xvals_neg))],g4); set(h,'EdgeColor','none')
        h=fill([xvals_pos fliplr(xvals_pos)],[zeros(size(xvals_pos)) 1.48*ones(size(xvals_pos))],g4); set(h,'EdgeColor','none')
        clear xvals*
        %
        plot(x_h1,U_h1(ind(i),:),'color',g1,'LineWidth',lw1);
        plot(x_h1,P_h1(ind(i),:),'color',g3,'LineWidth',lw1);

        ylim([0 1.5])
        text(48, 1.35,strcat(['t=' num2str(ind(i))]),'horizontalalignment','right')
    else
        text(48, 5.5,strcat(['t=' num2str(ind(i))]),'horizontalalignment','right')
        legend('U','P','location','NorthWest')
    end
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');
    
    axes('position',[sx+dx+w sy+(i-1)*(dy+he) w he])
    hold on
    plot(x_h2,U_h2(ind(i),:),'color',g1,'LineWidth',lw1);
    plot(x_h2,P_h2(ind(i),:),'color',g3,'LineWidth',lw1);
    box on
    xlim([-xmax xmax])
    if i < 3
        N_h2 = U_h2(ind(i),:)+P_h2(ind(i),:);
        xvals = x_h2(N_h2>ncrit & P_h2(ind(i),:)<ncrit);
        xvals_neg = xvals(xvals<0);
        xvals_pos = xvals(xvals>0);
        h=fill([xvals_neg fliplr(xvals_neg)],[zeros(size(xvals_neg)) 1.48*ones(size(xvals_neg))],g4); set(h,'EdgeColor','none')
        h=fill([xvals_pos fliplr(xvals_pos)],[zeros(size(xvals_pos)) 1.48*ones(size(xvals_pos))],g4); set(h,'EdgeColor','none')
        clear xvals*
        %
        plot(x_h2,U_h2(ind(i),:),'color',g1,'LineWidth',lw1);
        plot(x_h2,P_h2(ind(i),:),'color',g3,'LineWidth',lw1);
        ylim([0 1.5])
        text(47, 1.35,strcat(['t=' num2str(ind(i))]),'horizontalalignment','right')
    else
        text(47, 5.5,strcat(['t=' num2str(ind(i))]),'horizontalalignment','right')
    end
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');
end

% label subpanels
axes('position',[0 0 1 1],'visible','off')
hold on
     line([0.52 0.52],[0.02 0.98],'color','k','LineWidth',lw2)
     text(0.3,0.02,'space','horizontalalignment','center')
     text(0.8,0.02,'space','horizontalalignment','center')
     text(0.02,0.5,'population density','horizontalalignment','center','rotation',90)
     text(0.06,     sy+3*he+2*dy,'a)','horizontalalignment','center')
     text(0.06+dx+w,sy+3*he+2*dy,'b)','horizontalalignment','center')
     text(0.06,     sy+2*he+1*dy,'c)','horizontalalignment','center')
     text(0.06+dx+w,sy+2*he+1*dy,'d)','horizontalalignment','center')
     text(0.06,     sy+he,'e)','horizontalalignment','center')
     text(0.06+dx+w,sy+he,'f)','horizontalalignment','center')
     set(gca,'FontSize',fs3,'Fontname', 'Arial');
axis([0 1 0 1])


% Backup previous settings
prePaperType = get(hh,'PaperType');
prePaperPosition = get(hh,'PaperPosition');
prePaperSize = get(hh,'PaperSize');

% Make changing paper type possible
set(hh,'PaperType','<custom>');
% Set the page size and position to match the figure's dimensions
position = get(hh,'Position');
set(hh,'PaperPosition',[0,0,position(3:4)]);
set(hh,'PaperSize',position(3:4));

%saveas(1,strcat(['fig3.jpg']))
%print -dpdf -r600 Figure_3.pdf
print -djpeg -r600 figS2.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);


