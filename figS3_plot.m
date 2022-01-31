clear all; close all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 24 January 2022

load fig3_stype=2.mat
speed_type3_a = speed_type3;

load fig3_stype=1.mat
speed_type3_b = speed_type3;


fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
lw2 = 1; % fig edges
lw1 = 1.5; % fig edges
msize = 25; % marker size

yy=1;
hvec2 = fliplr(hvec);

width = 15;
height = 6;
xpos = 3;
ypos = 2;
sx = 0.11;
sy = 0.2;
w = 0.38;
he = 0.7;
dx = 0.1;

figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

colormap(cool)

axes('position',[sx sy w he])
    imagesc(flipud(speed_type3_a),[0.2 0.5])
    colorbar
    xlabel('symbiont net effect (fecundity)','fontsize',fs1)
    %ylabel('half-saturation constant (h)','fontsize',fs1)
    set(gca,'XTick',3:4:length(nvec))
    set(gca,'XTickLabel',nvec(3:4:end))
    set(gca,'YTick',1:yy:length(hvec))
    set(gca,'YTickLabel',hvec2(1:yy:end))
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

axes('position',[sx+dx+w sy w he])
    imagesc(flipud(speed_type3_b),[0.2 0.5])
    colorbar
    xlabel('symbiont net effect (survival)','fontsize',fs1)
    %ylabel('half-saturation constant (h)','fontsize',fs1)
    set(gca,'XTick',3:4:length(nvec))
    set(gca,'XTickLabel',nvec(3:4:end))
    set(gca,'YTick',1:yy:length(hvec))
    set(gca,'YTickLabel',hvec2(1:yy:end))
    set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');

% label subpanels
axes('position',[0 0 1 1],'visible','off')
hold on
     text(0.05,     0.95,'a)','horizontalalignment','center')
     text(0.05+w+dx,0.95,'b)','horizontalalignment','center')
     text(0.015,0.53,'half-saturation constant (h)','horizontalalignment','center','rotation',90)
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
print -djpeg -r600 figS3.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);


