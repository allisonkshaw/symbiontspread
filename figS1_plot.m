clear all
% model written by Allison Shaw (contact for assistance: ashaw@umn.edu)
%   last updated: 25 January 2022

beta = 2; % transmission rate (density-dependent) [per ind per year]
h = 0.5;  % half-saturation constant for type II transmission

Uvec = linspace(0,5,100);

DD = beta*Uvec;
FD = beta*Uvec./(Uvec);
t2 = beta*Uvec./(h+Uvec);


width = 7;
height = 6;
xpos = 3;
ypos = 2;
sx = 0.12;
sy = 0.15;
w = 0.8;
he = 0.8;

fs1 = 10;  % axes labels
fs3 = 09;  % axis numbering
lw2 = 1; % fig edges
lw1 = 1.5; % lines


figure(1); clf
hh = gcf;
set(hh,'PaperUnits','centimeters');
set(hh,'Units','centimeters');
set(gcf,'Position',[xpos ypos width height])

axes('position',[sx sy w he])
plot(Uvec,DD,Uvec,FD,Uvec,t2,'LineWidth',lw1)
legend('DD','FD','h = 0.5','location','southeast','AutoUpdate','off')
hold on
line([h h],[0 3],'color','k','LineStyle','--','LineWidth',lw1)
axis([0 5 0 3])
xlabel('host density','fontsize',fs1)
set(gca,'FontSize',fs3,'LineWidth',lw2,'Fontname', 'Arial');
set(gca,'XTick',[0 h])
set(gca,'XTickLabel',{'0','h'})
set(gca,'YTick',[0 beta])
set(gca,'YTickLabel',{'0','\beta'})


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
print -djpeg -r600 figS1.jpg

% Restore the previous settings
set(hh,'PaperType',prePaperType);
set(hh,'PaperPosition',prePaperPosition);
set(hh,'PaperSize',prePaperSize);
