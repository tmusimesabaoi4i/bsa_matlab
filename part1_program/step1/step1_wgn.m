%% start

%% initialization
close all;
clc;
clear;

%% constant
A = sqrt(2);
T = 1;
fs = 48e3;

%% create vector
t = 0 : 1/fs : T - 1/fs;
y = wgn(fs*T, 1, 0);

%% plot signal
figure('position', [0, 0, 500*sqrt(2), 500]);

plot(t,y);
ylabel('amplitude[Pa]');
xlabel('time[sec]');
xlim([t(1) t(end)]);
ylim([-5 5]);
ax = gca;
ax.FontSize = 17;

strtitle = 'WGN SIGNAL';
sgtitle(strtitle, 'FontSize', 17);

%% save as png
f = gcf;
exportgraphics(f, 'step1_wgn.png', 'Resolution', 500);

%% end
