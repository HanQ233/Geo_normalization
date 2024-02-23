%散点图
%% 预设画图选项
clc;clf;close all;clear;tic %清除命令行clc，清除工作区 clear
set(0,'DefaultFigureWindowStyle','docked');%窗口
% 字号、投点、坐标属性 
set(groot,'defaultAxesLabelFontSizeMultiplier',1.0,'defaultAxesFontSize',15,'defaultTextFontSize',15,'defaultColorbarFontSize',15,...
    'defaultLegendFontSize',15,'DefaultLineMarkerSize',11,'DefaultErrorbarCapSize',3);set(groot,'DefaultErrorbarMarkerSize',11,...  
    'defaultAxesNextPlot','add','defaultAxesYMinorTick', 'on','defaultAxesXMinorTick','on','defaultAxesTickLength', [0.0200 0.0250],'defaultAxesLayer', 'top',...
    'defaultAxesLineWidth', 0.5000,'defaultAxesBox', 'on','defaultAxesPlotBoxAspectRatioMode','manual','defaultAxesPlotBoxAspectRatio',[4 3 1],...
    'defaultAxesXColor', [0 0 0],'defaultAxesYColor', [0 0 0],'defaultAxesMinorGridColor',[0 0 0],'defaultAxesGridColor',[0 0 0]); 
run('QiColor9.m');
mark=["o";"^";"s";"d"];col = [red;yellow;blue;green];
%% 读取、筛选数据
% 下载文件 
url = 'https://github.com/HanQ233/Geo_normalization/raw/main/Normal_Value.mat';
websave('Normal_Value.mat', url);N = load('Normal_Value.mat');S1=table2array(N.C_REE);%读取REE球粒陨石标准化
filename='SIERRA_NEVADA_MAGMATIC_ARC.xlsx';%读取数据表格
C0 = readtable(filename,'Sheet','SIERRA_NEVADA_MAGMATIC_ARC','Range','A1:FO200', 'ReadVariableNames',true,'VariableNamingRule','preserve');
C0 = addvars(C0, C0.('ROCK NAME'),'NewVariableNames', 'Rockname','after','ROCK NAME');
for i = 1:numel(C0.('ROCK NAME'))
    % 如果当前单元格包含 'DIORITE' 字符串，则将其替换为数字1
    if contains(C0.Rockname{i}, 'GABBRO')
        C0.Rockname{i} = 1;
    elseif contains(C0.Rockname{i}, 'DIORITE')
        C0.Rockname{i} = 2;
    elseif contains(C0.Rockname{i}, 'TONALITE')
        C0.Rockname{i} = 3;
    elseif contains(C0.Rockname{i}, 'GRANITE')
        C0.Rockname{i} = 4;
    else 
        C0.Rockname{i} = 0;
    end
end
C = C0(cellfun(@(x) x ~= 0, C0.Rockname),:);


%% 01 主量元素散点图
close(figure(1));figure('Name','Major');
tiledlayout(2,3,'tilespacing','tight')
ax1 = nexttile(1);ax2 = nexttile(2);ax3 = nexttile(3);
ax4 = nexttile(4);ax5 = nexttile(5);ax6 = nexttile(6);
for i=1:height(C)
    k = cell2mat(C.Rockname(i)); %岩石类型
    x1=C.SIO2(i);x2=x1;x3=x1;x4=x1;x5=x1;%SIO2
    y1=C.K2O(i)+C.NA2O(i);%K2O+NA2O
    y2=C.NA2O(i)+C.K2O(i)-C.CAO(i); %K2O+NA2O-CAO
    y3=C.K2O(i);
    y4=C.MGO(i)./40.31./(C.FEOT(i)/71.85*0.9+C.MGO(i)./40.31);%Mg#
    y5=C.FEOT(i)./(C.FEOT(i)+C.MGO(i));%Fe#
    x6=C.AL2O3(i)/102./((C.CAO(i)/56)+(C.NA2O(i)/62)+(C.K2O(i)/94));%A/CNK
    y6=C.AL2O3(i)/102./((C.NA2O(i)/62)+(C.K2O(i)/94)); %A/NK
    x=[x1 x2 x3 x4 x5 x6];
    y=[y1 y2 y3 y4 y5 y6];
    for n=1:6
        nexttile(n)
        plot(x(n),y(n),'marker',mark(k),'MarkerfaceColor',col(k,1:3),'MarkeredgeColor','k');
    end
end
%定义坐标轴属性
axes(ax1);
xlim([40 80]);ylim([0 10]);
plot([41 41],[0 7],'-k',[41 52.5],[7 14],'-k',[41 45],[3 3],'-k',[45 45],[0 5],'-k',[45 61],[5 13.5],'-k',...
    [45 52],[5 5],'-k',[52 63],[5 7],'-k',[63 69],[7 8],'-k',[52 52],[0 5],'-k',[52.5 57.6],[14 11.7],'-k',[53 57],[9.3 5.9],'-k',...
    [57 57],[0 5.9],'-k',[63 63],[0 7],'-k',[45 49.4],[9.4 7.3],'-k',[48.4 53],[11.5 9.3],'-k',[49.4 52],[7.3 5],'-k',...
    [57.6 63],[11.7 7],'-k',[52.5 52.5],[18 14],'-k',[69 77.3],[8 0],'-k', [69 71.8],[8 13.5],'-k',[41 41],[0 7],'-k',...
    [41 41],[0 7],'-k',[41 41],[0 7],'-k',[61 71.8],[8.6 13.5],'-k','linewidth',1);%Middlemost1994
text(42,0.8,{'Picro-';'basalt'},'fontsize',14);text(47.3,1.3,{'Basalt'},'fontsize',14);text(52.8,1.5,{'Basaltic';'andesite'},'fontsize',14);
text(47.5,5.8,{'Trachy-';'basalt'},'fontsize',14);text(41.5,6,{'Tephrit';'basanite'},'fontsize',14);text(51,7,{'Basaltic';'trachy-';'basalt'},'fontsize',14);
a=0:0.5:10;b=-(3.3539*10^-4)*a.^6+(1.2030*10^-2)*a.^5-(1.5188*10^-1)*a.^4+(8.6096*10^-1)*a.^3-2.1111*a.^2+3.9492.*a+39.0;
plot(b,a,'--b','linewidth',1);% Irvine1971
ylabel('NA2O + K2O (wt%)');xlabel('SIO2 (wt%)');
axes(ax2);
a1=40:1:80;
xlim([40 80]);ylim([-15 10]);
b1=-41.86+1.112*a1-0.00572*a1.^2; %碱性--碱钙性系列
b2=-44.72+1.094*a1-0.00527*a1.^2;%碱钙性--钙碱性
b3=-45.36+1.0043*a1-0.00427*a1.^2;%钙碱性--钙
plot (a1,b1,'-k',a1,b2,'-k',a1,b3,'-k');
tx=text(60.6,5.13,'alkalic');tx.FontSize=12;tx.Rotation=28;
tx=text(60.9,2.7,'alkali-calcic');tx.FontSize=12;tx.Rotation=30;
tx=text(60.9,1.0, 'calc-alkalic');tx.FontSize=12;tx.Rotation=30;
tx=text(61.3,-0.5, 'calcic');tx.FontSize=12;tx.Rotation=30;
a=gca;a.YLabel.String = 'Na2O+K2O-CaO';a.XLabel.String = 'SiO2 (wt%)';
axes(ax3);%K2O
xlim([40 80]);
b1=0.085*a1-2.88; %高-中
b2=0.0454*a1-1.86;%中-低
plot (a1,b1,'-k',a1,b2,'-k');%根据Le Maitre 2002 Book
tx=text(60.6,2.7,cellstr('High-K Series'));tx.FontSize=12;tx.Rotation=9;
tx=text(60.6,1.6,cellstr('Medium-K Series'));tx.FontSize=12;tx.Rotation=5;
tx=text(60.6,0.37,cellstr( 'Medium-K Series'));tx.FontSize=12;tx.Rotation=3;
ylabel('K2O (wt%)');xlabel('SiO2 (wt%)');
title('no use','fontsize',8)
axes(ax4);
xlim([40 80]);
ylabel( 'Mg# (wt%)');xlabel('SiO2 (wt%)');
axes(ax5);
xlim([40 80]); ylim([0.4 1]);
ylabel('FeOT/(FeOT+MgO)');xlabel('SiO2 (wt%)');
a=40:1:80;b=0.486+0.0046*a;
plot(a,b,'-k');
axes(ax6);%ACNK
xlim([0 1.5]); ylim([0.8 10]);
ylabel('A/NK');xlabel('A/CNK');
%图例
axes(ax1);
L1=plot(0,0,'o','marker',mark(1),'MarkerfaceColor',col(1,1:3),'MarkeredgeColor','k');
L2=plot(0,0,'o','marker',mark(2),'MarkerfaceColor',col(2,1:3),'MarkeredgeColor','k');
L3=plot(0,0,'o','marker',mark(3),'MarkerfaceColor',col(3,1:3),'MarkeredgeColor','k');
L4=plot(0,0,'o','marker',mark(4),'MarkerfaceColor',col(4,1:3),'MarkeredgeColor','k');
legend(ax1,[L1 L2 L3 L4],{'GABBRO' ,'DIORITE','TONALITE','GRANITE',},'location','southeast','box','on');
%% 02 稀土配分图
close(figure(2));figure('Name','REE');
tiledlayout(2,3,'tilespacing','tight')
ax1 = nexttile(1);ax2 = nexttile(2);ax3 = nexttile(3);ax4 = nexttile(4);
x=1:14;
R1= ["LA","CE","PR","ND","SM","EU","GD","TB","DY","HO","ER","TM","YB","LU"];
for i=1:height(C)
    k = cell2mat(C.Rockname(i)); %岩石类型
    y=C{i,R1}./S1(1,1:14);
        nexttile(k)%不同类型
            plot(x,y,'-','Color',col(k,1:3),'marker',mark(k),'MarkerfaceColor',col(k,1:3),'MarkeredgeColor','k')
end
axes(ax1);
xlim([0 15]);ylim([0.1 1000]);pbaspect([3 2 1]);
set(gca,'yscale','log','YTick',[0.1 1 10 100 1000],'YTickLabel',[0.1 1 10 100 1000],'xtick',(1:14),'XTickLabelRotation',0,...
    'xticklabel',{'La','Ce','Pr','Nd','Sm','Eu','Gd','Tb','Dy','Ho','Er','Tm','Yb','Lu'},'XMinorTick','off','fontsize',14); %x轴范围1-6，间隔1
ylabel('Sample / Chondrite');title('GABBRO');
axes(ax2);
ylabel('Sample / Chondrite');title('DIORITE');
axes(ax3);
ylabel('Sample / Chondrite');title('TONALITE');
axes(ax4);
ylabel('Sample / Chondrite');title('GRANITE');
linkprop([ax1,ax2,ax3,ax4],{'XLim','YLim','XTick','XTickLabel','PlotBoxAspectRatio','YScale','XMinorTick','YTickLabel','YTick','fontsize'}); %关联属性
