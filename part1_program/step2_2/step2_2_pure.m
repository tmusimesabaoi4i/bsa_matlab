%% This program creates a diagram of the signal and the power spectrum density.

%% start

%% initialization
close all;
clc;
clear;

%% add path
addpath('../spectrum_lib/');

%% font setting
setting_fontsize = 18;

%% constant
A = sqrt(2);
f = 1e3;
T = 2;
fs = 48e3;

%% create vector
t = 0 : 1/fs : T - 1/fs;
y = A * sin(2 * pi * f * t);

%% plot signal
figure('position', [0, 0, 500*sqrt(2), 500]);

subplot(2,1,1);
plot(t,wind_y(y));
ylabel('amplitude[Pa]');
xlabel('time[sec]');
xlim([t(1) t(end)]);
ylim([-2 2]);
ax = gca;
ax.FontSize = setting_fontsize;

subplot(2,1,2);
[f,gx] = fpsd(wind_y(y),fs);
plot(f/1e3,10*log10(gx));
ylabel('PSD[dB/Hz]');
xlabel('frequency[kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim([-200 50]);
ax = gca;
ax.FontSize = setting_fontsize;

strtitle = 'POWER SPECTRAL DENSITY[PURE SIGNAL]';
sgtitle(strtitle, 'FontSize', setting_fontsize);

%% save as png
fig = gcf;
exportgraphics(fig, 'step2_2_pure.png', 'Resolution', 500);

%% remove path
rmpath('../spectrum_lib/');

%% end
