%% This program creates a diagram of the signal and the power spectrum.

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
T = 2;
fs = 48e3;

%% create vector
t = 0 : 1/fs : T - 1/fs;
y = wgn(fs*T, 1, 0).';

%% plot signal
figure('position', [0, 0, 500*sqrt(2), 500]);

subplot(2,1,1);
plot(t,wind_y(y));
ylabel('amplitude[Pa]');
xlabel('time[sec]');
xlim([t(1) t(end)]);
ylim([-5 5]);
ax = gca;
ax.FontSize = setting_fontsize;

subplot(2,1,2);
[f,psx] = fps(wind_y(y),fs);
plot(f/1e3,10*log10(psx/(20e-6).^2));
ylabel('power spectrum[dB SPL]');
xlabel('frequency[kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim([0 100]);
ax = gca;
ax.FontSize = setting_fontsize;

strtitle = 'POWER SPECTRUM[WGN SIGNAL]';
sgtitle(strtitle, 'FontSize', setting_fontsize);

%% save as png
fig = gcf;
exportgraphics(fig, 'step2_1_wgn.png', 'Resolution', 500);

%% remove path
rmpath('../spectrum_lib/');

%% end
