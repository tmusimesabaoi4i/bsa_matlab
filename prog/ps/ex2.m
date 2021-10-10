%% START

%% Initialization
close all;
clc;
clear;

%% File name
filename = 'sample2';

%% Read audio file
[y,fs] = audioread(['../../' filename '.wav']);


%% Make limit of plot and Font size
lim = { [-1 1] , [0 0.05] , [-0.75 0.75]};
setting_fontsize = 18;

%% Make time array
T = length(y)/fs;
t = 0 : 1/fs : T-1/fs;

%% Calc fft
Y = fft(y);
L = length(Y);

%% Get Single-Sided Spectrum
z = Y/L;
h_z = z(1:L/2+1);
h_z(2:end-1) = 2*h_z(2:end-1);

%% Get amplitude
amplitude = abs(h_z);

%% Get theta
re = real(h_z);
im = imag(h_z);
tol = 1e-2;
im(amplitude < tol) = 0;
theta = atan(im./re);

%% Make frequency array
f = linspace(0,fs/2,length(amplitude));

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
plot(f/1e3,amplitude);
ylabel('amplitude');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{2});
ax = gca;
ax.FontSize = setting_fontsize;

%% Theta plot
subplot(3,1,3);
plot(f/1e3,theta/pi);
ylabel('theta / \pi');
xlabel('frequency [kHz]');
xlim([f(1)/1e3 f(end)/1e3]);
ylim(lim{3});
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [ '../../img/ps/' filename '.png' ] , 'Resolution', 500);

%% END
