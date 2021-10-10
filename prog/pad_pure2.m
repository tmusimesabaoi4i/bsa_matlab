%% START

%% Initialization
close all;
clc;
clear;

%% Add path
addpath('spectrum_lib/');

%% File name
setting_fontsize = 16;
filename = '../img/pad_pure2';

%% Make time array
fs = 44.1e3;
T = 5;
t = 0 : 1/fs : T-1/fs;
freq = 1e3;
A = sqrt(2);

%% Make sound wave
y = A * sin(2 * pi * freq * t);
[~,psx] = fps(y,fs);

%% Get rms
db_max = max(10*log10(psx/(20e-6).^2));

%% Make limit of plot and Font size
lim = {[-5 5]};
setting_fontsize = 18;

%% Apply window
[yw,ACF,ECF] = wind_y(y);

%% Apply factor
y1 = ACF*yw;
y2 = yw;

%% Get PS
[~,psx1] = fps_pad(y1,fs);
[~,psx2] = fps_pad(y2,fs);

%% Get rms
db_max1 = ECF*max(10*log10(psx1/(20e-6).^2));
db_max2 = max(10*log10(psx1/(20e-6).^2));
db_max3 = ECF*max(10*log10(psx2/(20e-6).^2));
db_max4 = max(10*log10(psx2/(20e-6).^2));

%% Disp
disp(['0: ' num2str(db_max) '[dB SPL]']);
disp(['1: ' num2str(db_max1) '[dB SPL]']);
disp(['2: ' num2str(db_max2) '[dB SPL]']);
disp(['3: ' num2str(db_max3) '[dB SPL]']);
disp(['4: ' num2str(db_max4) '[dB SPL]']);

%% Bar
figure('position', [0, 0, 600*16/9, 600]);
strA = {'ANS' , 'Pattern1' , 'Pattern2' , 'Pattern3' , 'Pattern4'};
X = categorical(strA);
X = reordercats(X,strA);
Y = [db_max db_max1 db_max2 db_max3 db_max4];
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
