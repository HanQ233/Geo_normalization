set(0,'DefaultFigureWindowStyle','docked');
%set字号 
set(groot,'defaultAxesLabelFontSizeMultiplier',1.0,'defaultAxesFontSize',12,'defaultTextFontSize',12,'defaultColorbarFontSize',10,'defaultLegendFontSize',10);
%set投点属性
set(groot,'defaultLineMarkerSize',8);set(groot,'defaultErrorbarCapSize',3);set(groot,'defaultErrorbarMarkerSize',8);
%set坐标属性
set(groot,'defaultAxesNextPlot','add'); 
set(groot,'defaultAxesYMinorTick', 'on','defaultAxesXMinorTick','on','defaultAxesTickLength', [0.0200 0.0250],'defaultAxesLayer', 'top');
set(groot,'defaultAxesFontName','Helvetica','defaultLegendFontName', 'Helvetica','defaultTextFontName', 'Helvetica');%字体
set(groot,'defaultAxesLineWidth', 0.5000);
set(groot,'defaultAxesBox', 'on','defaultAxesPlotBoxAspectRatioMode','manual','defaultAxesPlotBoxAspectRatio',[4 3 1]);
%set(groot,'DataAspectRatioMode','auto');%'defaultAxesDataAspectRatio', [1 1 1]);
%set坐标轴颜色
set(groot,'defaultAxesXColor', [0 0 0],'defaultAxesYColor', [0 0 0],'defaultAxesMinorGridColor',[0 0 0],'defaultAxesGridColor',[0 0 0]);
%figure属性
%set(gcf,'Renderer','painters');%设置矢量图