close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 24 January 2022

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
dx = 0.12;
dy = 0.09;

xx = 5; yy=5;

g1 = [0 0 0]; % black
g2 = [0.7 0.7 0.7]; % light grey
g3 = [0.5 0.5 0.5]; % med grey

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

colormap(cool)

load fig4_beta.mat
ind = [6 16 21];
axes('position',[sx sy+2*dy+2*he w he])
    imagesc(speed_FD2,[0.2 0.6])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(betavec))
    set(gca,'YTickLabel',betavec(1:yy:end))
    ylabel('transmission (\beta)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w      sy+2*dy+2*he w he])
    imagesc(speed_FD1,[0.2 0.6])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(betavec))
    set(gca,'YTickLabel',betavec(1:yy:end))
    ylabel('transmission (\beta)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

%%
load fig4_v.mat
ind = [1 11 19];
axes('position',[sx      sy+dy+he w he])
    imagesc(speed_FD2,[0.2 0.6])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(vivec))
    set(gca,'YTickLabel',vivec(1:yy:end))
    ylabel('dispersal (v)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w sy+dy+he w he])
    imagesc(speed_FD1,[0.2 0.6])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(vivec))
    set(gca,'YTickLabel',vivec(1:yy:end))
    ylabel('dispersal (v)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');


%%
load fig4_AE.mat
ind = [1 2 3];
axes('position',[sx      sy w he])
    imagesc(speed_DD2,[0 0.4])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(avec))
    set(gca,'YTickLabel',avec(1:yy:end))
    ylabel('Allee threshold (a)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');
    
axes('position',[sx+dx+w sy w he])
    imagesc(speed_DD1,[0 0.4])
    colorbar
    set(gca,'XTick',1:xx:length(nvec))
    set(gca,'XTickLabel',nvec(1:xx:end))
    set(gca,'YTick',1:yy:length(avec))
    set(gca,'YTickLabel',avec(1:yy:end))
    ylabel('Allee threshold (a)','fontsize',fs1)
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');


% label subpanels
axes('position',[0 0 1 1],'visible','off')
hold on
     text(0.02,     0.08+3*he+2*dy,'a)','horizontalalignment','center')
     text(0.02+w+dx,0.08+3*he+2*dy,'b)','horizontalalignment','center')
     text(0.02,     0.08+2*he+dy,'c)','horizontalalignment','center')
     text(0.02+w+dx,0.08+2*he+dy,'d)','horizontalalignment','center')
     text(0.02,     0.08+he,'e)','horizontalalignment','center')
     text(0.02+w+dx,0.08+he,'f)','horizontalalignment','center')
     text(0.25,0.02,'symbiont net effect (fecundity)','horizontalalignment','center')
     text(0.75,0.02,'symbiont net effect (survival)','horizontalalignment','center')
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
print -djpeg -r600 figS4.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);
