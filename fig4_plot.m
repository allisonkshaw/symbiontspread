close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 21 March 2021

fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
lw2 = 1; % fig edges
lw1 = 1.5; % fig edges
msize = 25; % marker size

width = 15;
height = 16;
xpos = 3;
ypos = 2;
sx = 0.11;
sy = 0.08;
w = 0.38;
he = 0.24;
dx = 0.1;
dy = 0.09;

g1 = [0 0 0]; % black
g2 = [0.7 0.7 0.7]; % light grey
g3 = [0.5 0.5 0.5]; % med grey

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])


%%
load fig4_beta.mat
axes('position',[sx sy+2*dy+2*he w he])
    i=1;plot(nvec,speed_FD2(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    hold on
    i=2;plot(nvec,speed_FD2(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    i=3;plot(nvec,speed_FD2(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    legend(num2str(betavec(1)),num2str(betavec(2)),num2str(betavec(3)),'Location','NorthWest')
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w      sy+2*dy+2*he w he])
    i=1;plot(nvec,speed_FD1(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    hold on
    i=2;plot(nvec,speed_FD1(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    i=3;plot(nvec,speed_FD1(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

%%
load fig4_v.mat
axes('position',[sx      sy+dy+he w he])
    i=1;plot(nvec,speed_FD2(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    hold on
    i=2;plot(nvec,speed_FD2(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    i=3;plot(nvec,speed_FD2(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    legend(num2str(vivec(1)),num2str(vivec(2)),num2str(vivec(3)),'Location','NorthWest')
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w sy+dy+he w he])
    i=1;plot(nvec,speed_FD1(i,:),'.','color',g1,'LineWidth',lw1,'MarkerSize',msize)
    hold on
    i=2;plot(nvec,speed_FD1(i,:),'.','color',g3,'LineWidth',lw1,'MarkerSize',msize)
    i=3;plot(nvec,speed_FD1(i,:),'.','color',g2,'LineWidth',lw1,'MarkerSize',msize)
    line([0 0],[0.2 0.6],'color','k','LineWidth',lw2)
    text(-0.15,0.22,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.22,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0.2 0.52])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');


%%
load fig4_AE.mat
axes('position',[sx      sy w he])
    i=1;plot(nvec,speed_DD2(i,:),'o','color',g1,'LineWidth',lw1)
    hold on
    i=2;plot(nvec,speed_DD2(i,:),'o','color',g3,'LineWidth',lw1)
    i=3;plot(nvec,speed_DD2(i,:),'o','color',g2,'LineWidth',lw1)
    line([0 0],[0 0.4],'color','k','LineWidth',lw2)
    legend(num2str(avec(1)),num2str(avec(2)),num2str(avec(3)),'position',[0.125 0.195 0.1340 0.0829])
    text(-0.12,0.03,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.12,0.03,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0 0.4])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');
    
axes('position',[sx+dx+w sy w he])
    i=1;plot(nvec,speed_DD1(i,:),'o','color',g1,'LineWidth',lw1)
    hold on
    i=2;plot(nvec,speed_DD1(i,:),'o','color',g3,'LineWidth',lw1)
    i=3;plot(nvec,speed_DD1(i,:),'o','color',g2,'LineWidth',lw1)
    line([0 0],[0 0.4],'color','k','LineWidth',lw2)
    text(-0.15,0.03,'parasite','HorizontalAlignment','center','FontSize',fs3)
    text( 0.15,0.03,'mutualist','HorizontalAlignment','center','FontSize',fs3)
    axis([-0.3 0.3 0 0.4])
    set(gca,'XTick',-0.3:0.1:0.3)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');


% label subpanels
axes('position',[0 0 1 1],'visible','off')
hold on
     line([0.02 0.98],[0.35 0.35],'color','k','LineWidth',lw2)
     line([0.02 0.98],[0.69 0.69],'color','k','LineWidth',lw2)
     text(0.05,     0.08+3*he+2*dy,'a)','horizontalalignment','center')
     text(0.05+w+dx,0.08+3*he+2*dy,'b)','horizontalalignment','center')
     text(0.05,     0.08+2*he+dy,'c)','horizontalalignment','center')
     text(0.05+w+dx,0.08+2*he+dy,'d)','horizontalalignment','center')
     text(0.05,     0.08+he,'e)','horizontalalignment','center')
     text(0.05+w+dx,0.08+he,'f)','horizontalalignment','center')
     text(0.015,-0.05+he,       'spread rate','horizontalalignment','center','rotation',90)
     text(0.015,-0.05+2*he+dy,  'spread rate','horizontalalignment','center','rotation',90)
     text(0.015,-0.05+3*he+2*dy,'spread rate','horizontalalignment','center','rotation',90)
     text(0.3,0.02,'symbiont net effect (fecundity)','horizontalalignment','center')
     text(0.78,0.02,'symbiont net effect (survival)','horizontalalignment','center')
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
print -djpeg -r600 fig4.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);