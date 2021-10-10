%% START

%% Initialization
close all;
clc;
clear;

%% Add path
addpath('spectrum_lib/');

%% File name
setting_fontsize = 16;
filename = '../img/pad_wgn2';

%% Make time array
fs = 44.1e3;
T = 5;
t = 0 : 1/fs : T-1/fs;

%% Make sound wave
y = wgn(length(t),1,5);
[~,psx] = fps(y,fs);

%% Get rms
pow = sum(psx);

%% Make limit of plot and Font size
lim = {[-5 5]};
setting_fontsize = 18;

%% Apply window
[yw,ACF,ECF] = wind_y(y');

%% Apply factor
y1 = ACF*yw;
y2 = yw;

%% Get PS
[~,psx1] = fps_pad(y1,fs);
[~,psx2] = fps_pad(y2,fs);

one = ones(size(y),'like',y);
[~,psx3] = fps(one,fs);
[~,psx4] = fps_pad(one,fs);
ECF_pad = sum(psx3)/sum(psx4);

%% Get rms
pow1 = ECF*sum(psx1);
pow2 = sum(psx1);
pow3 = ECF*sum(psx2);
pow4 = sum(psx2);
pow5 = ECF_pad*ECF*sum(psx1);
pow6 = ECF_pad*sum(psx1);
pow7 = ECF_pad*ECF*sum(psx2);
pow8 = ECF_pad*sum(psx2);

%% Disp
disp(['0: ' num2str(pow) '[W]']);
disp(['1: ' num2str(pow1) '[W]']);
disp(['2: ' num2str(pow2) '[W]']);
disp(['3: ' num2str(pow3) '[W]']);
disp(['4: ' num2str(pow4) '[W]']);
disp(['5: ' num2str(pow5) '[W]']);
disp(['6: ' num2str(pow6) '[W]']);
disp(['7: ' num2str(pow7) '[W]']);
disp(['8: ' num2str(pow8) '[W]']);

%% Bar
figure('position', [0, 0, 600*16/9, 600]);
strA = {'ANS' , 'Pattern1' , 'Pattern2' , 'Pattern3' , 'Pattern4' , 'Pattern5' , 'Pattern6' , 'Pattern7' , 'Pattern8'};
X = categorical(strA);
X = reordercats(X,strA);
Y = [pow pow1 pow2 pow3 pow4 pow5 pow6 pow7 pow8];
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
