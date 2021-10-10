%% START

%% Initialization
close all;
clc;
clear;

%% Add path
addpath('spectrum_lib/');

%% File name
setting_fontsize = 16;
filename = '../img/wind_wgn1';

%% Make time array
fs = 44.1e3;
T = 5;
t = 0 : 1/fs : T-1/fs;

%% Make sound wave
y = wgn(length(t),1,5);

%% Get rms
y_ms = rms(y)*rms(y);

%% Make limit of plot and Font size
lim = {[-5 5]};
setting_fontsize = 18;

%% Apply window
[y,ACF,ECF] = wind_y(y');

%% Apply factor
y1 = ACF*y;
y2 = y;

%% Get rms
y_ms1 = ECF*rms(y1)*rms(y1);
y_ms2 = rms(y1)*rms(y1);
y_ms3 = ECF*rms(y2)*rms(y2);
y_ms4 = rms(y2)*rms(y2);

%% Disp
disp(['0: ' num2str(y_ms) '[W]']);
disp(['1: ' num2str(y_ms1) '[W]']);
disp(['2: ' num2str(y_ms2) '[W]']);
disp(['3: ' num2str(y_ms3) '[W]']);
disp(['4: ' num2str(y_ms4) '[W]']);

%% Bar
strA = {'ANS' , 'Pattern1' , 'Pattern2' , 'Pattern3' , 'Pattern4'};
X = categorical(strA);
X = reordercats(X,strA);
Y = [y_ms y_ms1 y_ms2 y_ms3 y_ms4];
b = bar(X,Y);
xtips = b.XEndPoints;
ytips = b.YEndPoints;
labels = string(b.YData);
text(xtips,ytips,labels,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',setting_fontsize);
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [filename '.png'] , 'Resolution', 500);

%% Remove path
rmpath('spectrum_lib/');

%% END
