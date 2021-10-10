%% START

%% Initialization
close all;
clc;
clear;

%% File name
filename = 'psd_cos';

%% Make time array
fs = 44.1e3;
T = 5;
t = 0 : 1/fs : T-1/fs;

%% Make sound wave
y = 1/2 * cos(2*pi*2e3*t -pi/4) + 3/2 *cos(2*pi*10e3*t +pi/3) + cos(2*pi*15e3*t);

%% Make limit of plot and Font size
lim = { [-4 4] , [-325 50] };
setting_fontsize = 18;

%% Calc fft
Y = fft(y);
L = length(Y);

%% Get Single-Sided Spectrum
z = Y/L;
h_z = z(1:L/2+1);
h_z(2:end-1) = 2*h_z(2:end-1);

%% Get amplitude
amplitude = abs(h_z);

%% Get Power
power = amplitude.*amplitude;

%% Make frequency array
f = linspace(0,fs/2,length(power));

%% Get power density
power_density = power / f(2) - f(1);

%% Make figure
figure('position', [0, 0, 600*16/9, 600]);

%% Time domain plot
subplot(2,1,1);
plot(t,y);
ylabel('amplitude [Pa]');
xlabel('time [sec]');
xlim([t(1) t(end)]);
ylim(lim{1});
ax = gca;
ax.FontSize = setting_fontsize;

%% Amplitude plot
subplot(2,1,2);
plot(f/1e3,10*log10(power_density));
ylabel('power density [dB/Hz]');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{2});
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [ '../img/' filename '.png' ] , 'Resolution', 500);

%% END
