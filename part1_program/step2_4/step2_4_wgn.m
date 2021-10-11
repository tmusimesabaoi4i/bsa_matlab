%% This is a program for creating signal diagrams and spectrograms.

%% start

%% initialization
close all;
clc;
clear;

%% add path
addpath('../spectrum_lib/');

%% font setting
setting_fontsize = 25;

%% constant
A = sqrt(2);
T = 2;
fs = 48e3;

%% create vector
t = 0 : 1/fs : T - 1/fs;
y = wgn(fs*T, 1, 0).';

%% plot signal
figure('position', [0, 0, 1000*sqrt(2), 1000]);

s1 = subplot(2,1,1);
plot(t,wind_y(y));
ylabel('amplitude[Pa]');
xlabel('time[sec]');
xlim([t(1) t(end)]);
ylim([-5 5]);
ax = gca;
ax.FontSize = setting_fontsize;

s2 = subplot(2,1,2);
[f,~] = fps(wind_y(y),fs);
spectrogram(y,256,120,256,fs,'yaxis');
ylim([ f(1)/1e3 f(end)/1e3 ]);
ylabel( 'frequency[kHz]' );
xlabel( 'time[sec]' );
ax = gca;
ax.FontSize = setting_fontsize;

s1Pos = get(s1,'position');
s2Pos = get(s2,'position');
s2Pos(3:4) = [s1Pos(3:4)];
set(s2,'position',s2Pos);

strtitle = 'SPECTROGRAM[WGN SIGNAL]';
sgtitle(strtitle, 'FontSize', setting_fontsize);

%% save as png
fig = gcf;
exportgraphics(fig, 'step2_4_wgn.png', 'Resolution', 500);

%% remove path
rmpath('../spectrum_lib/');

%% end
