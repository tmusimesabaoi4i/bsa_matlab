%% START

%% Initialization
close all;
clc;
clear;

%% File name
filename = 'cos_wave';

%% Make time array
T = 5;
t = 0 : 1/fs : T-1/fs;

%% Make sound wave
fs = 44.1e3;
y = 1/2 * cos(2*pi*2e3*t -pi/4) + 3/2 *cos(2*pi*10e3*t +pi/3) + cos(2*pi*15e3*t);

%% Make limit of plot and Font size
lim = { [-1 1] , [0 2] , [-0.75 0.75]};
setting_fontsize = 18;

%% Get amplitude and theta
Y = fft(y);
L = length(Y);
amplitude = abs(Y/L);
h_amplitude = amplitude(1:L/2+1);
h_amplitude(2:end-1) = 2*h_amplitude(2:end-1);

re = real(Y/L);
im = imag(Y/L);

tol = 5e-3;
im(amplitude < tol) = 0;

theta = atan(im./re);
h_theta = theta(1:L/2+1);

%% Make frequency array
f = linspace(0,fs/2,length(h_amplitude));

%% Make figure
figure('position', [0, 0, 600*16/9, 600]);

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
ylabel('amplitude');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{2});
ax = gca;
ax.FontSize = setting_fontsize;

%% Theta plot
subplot(3,1,3);
plot(f/1e3,h_theta/pi);
ylabel('theta / \pi');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{3});
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [ '../img/' filename '.png' ] , 'Resolution', 500);

%% END
