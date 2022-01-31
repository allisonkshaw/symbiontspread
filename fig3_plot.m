clear all; close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 19 January 2022

load fig3_stype=2.mat
speed_DD_a = speed_DD;
speed_FD_a = speed_FD;
speed_type3_a = speed_type3;

load fig3_stype=1.mat
speed_DD_b = speed_DD;
speed_FD_b = speed_FD;
speed_type3_b = speed_type3;


fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
lw2 = 1; % fig edges
lw1 = 1.5; % fig edges
msize = 25; % marker size

width = 15;
height = 6.5;
xpos = 3;
ypos = 2;
sx = 0.11;
sy = 0.17;
w = 0.37;
he = 0.75;
dx = 0.11;

g0 = [0 0 0]; % black
g1 = [0.4 0.4 0.4]; % med grey
g2 = [0.6 0.6 0.6]; % med grey
g3 = [0.8 0.8 0.8]; % light grey

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

axes('position',[sx sy w he])
    ind = [2 3 6];
    plot(nvec,speed_DD_a,'o','color',g0,'LineWidth',lw1)
    hold on
    i=ind(1);plot(nvec,speed_type3_a(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    i=ind(2);plot(nvec,speed_type3_a(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    i=ind(3);plot(nvec,speed_type3_a(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    plot(nvec,speed_FD_a,'.','color',g0,'LineWidth',lw1,'MarkerSize',msize)
    legend('DD',strcat(['h=',num2str(hvec(ind(1)))]),strcat(['h=',num2str(hvec(ind(2)))]),strcat(['h=',num2str(hvec(ind(3)))]),'FD','Location','NorthWest','AutoUpdate','off')
    plot(nvec,speed_DD_a,'o','color',g0,'LineWidth',lw1)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    xlabel('symbiont net effect (fecundity)','fontsize',fs1)
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w sy w he])
    plot(nvec,speed_DD_b,'o','color',g0,'LineWidth',lw1)
    hold on
    i=ind(1);plot(nvec,speed_type3_b(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    i=ind(2);plot(nvec,speed_type3_b(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    i=ind(3);plot(nvec,speed_type3_b(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    plot(nvec,speed_FD_b,'.','color',g0,'LineWidth',lw1,'MarkerSize',msize)
    plot(nvec,speed_DD_b,'o','color',g0,'LineWidth',lw1)
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



