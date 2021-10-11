%% start

%% initialization
close all;
clc;
clear;

%% constant
A = sqrt(2);
f = 1e3;
T = 1;
fs = 48e3;

%% create vector
t = 0 : 1/fs : T - 1/fs;
y = A * sin(2 * pi * f * t);

%% plot signal
figure('position', [0, 0, 500*sqrt(2), 500]);

plot(t,y);
ylabel('amplitude[Pa]');
xlabel('time[sec]');
xlim([t(1) t(end)]);
ylim([-2 2]);
ax = gca;
ax.FontSize = 17;

strtitle = 'PURE SIGNAL';
sgtitle(strtitle, 'FontSize', 17);

%% save as png
f = gcf;
exportgraphics(f, 'step1_pure.png', 'Resolution', 500);

%% end
