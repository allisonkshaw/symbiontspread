clear all; close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 21 March 2021

load fig3_stype=2.mat
speed_DD_a = speed_DD;
speed_FD_a = speed_FD;

load fig3_stype=1.mat
speed_DD_b = speed_DD;
speed_FD_b = speed_FD;


fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
lw2 = 1; % fig edges
lw1 = 1.5; % fig edges
msize = 25; % marker size

width = 15;
height = 5;
xpos = 3;
ypos = 2;
sx = 0.11;
sy = 0.2;
w = 0.38;
he = 0.7;
dx = 0.1;

g1 = [0 0 0]; % black

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

axes('position',[sx sy w he])
    plot(nvec,speed_DD_a,'o','color',g1,'LineWidth',lw1)
    hold on
    plot(nvec,speed_FD_a,'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    xlabel('symbiont net effect (fecundity)','fontsize',fs1)
    legend('DD','FD','Location','NorthWest')
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w sy w he])
    plot(nvec,speed_DD_b,'o','color',g1,'LineWidth',lw1)
    hold on
    plot(nvec,speed_FD_b,'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    xlabel('symbiont net effect (survival)','fontsize',fs1)
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

% label subpanels
axes('position',[0 0 1 1],'visible','off')
hold on
     text(0.05,     0.95,'a)','horizontalalignment','center')
     text(0.05+w+dx,0.95,'b)','horizontalalignment','center')
     text(0.015,0.53,'population spread rate','horizontalalignment','center','rotation',90)
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
print -djpeg -r600 fig3.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);



