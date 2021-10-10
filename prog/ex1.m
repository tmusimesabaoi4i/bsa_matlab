%% START

%% Initialization
close all;
clc;
clear;

%% File name
filename = 'sample';

%% Read audio file
[y,fs] = audioread(['../' filename '.wav']);

%% Make limit of plot
lim = { [-10 10] , [-25 100] , [-125 25]};

%% Make time array
T = length(y)/fs;
t = 0 : 1/fs : T-1/fs;

%% Get amplitude and theta
Y = fft(X);
amplitude = abs(Y/L);
theta = angle(Y/L);
h_amplitude = amplitude(1:L/2+1);
h_theta = theta(1:L/2+1);
h_amplitude(2:end-1) = 2*h_amplitude(2:end-1);
h_theta(2:end-1) = 2*h_theta(2:end-1);

%% Make frequency array
f = linspace(0,fs/2,length(h_amplitude));

%% Make figure
figure('position', [0, 0, 300*16/9, 300]);

%% Time domain plot
subplot(3,1,1);
plot(t,y);
ylabel('amplitude [Pa]');
xlabel('time [sec]');
xlim([t(1) t(end)]);
ylim(lim{1});
ax = gca;
ax.FontSize = setting_fontsize;

%% Amplitude plot
subplot(3,1,2);
plot(f/1e3,h_amplitude);
ylabel('');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{2});
ax = gca;
ax.FontSize = setting_fontsize;

%% Theta plot
subplot(3,1,3);
plot(f/1e3,h_theta);
ylabel('');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{3});
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [ '../img' filename '.png' ] , 'Resolution', 500);

%% END
