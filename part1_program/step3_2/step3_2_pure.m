%% This is a program to check how the "power spectrum" and "power spectrum density" change

%% start

%% initialization
close all;
clc;
clear;

%% add path
addpath('../spectrum_lib/');

%% font setting
setting_fontsize = 18;

%% for sentence
a_fs = linspace(20e3,100e3,100);
T = 3;

%% make frame object
F = struct('cdata',[],'colormap',[]);
n = 1;

for fs = a_fs

  %% constant
  A = sqrt(2);
  f = 1e3;

  %% create vector
  t = 0 : 1/fs : T - 1/fs;
  y = A * sin(2 * pi * f * t);

  %% plot signal
  figure('position', [0, 0, 800*sqrt(2), 800]);

  subplot(3,1,1);
  plot(t,wind_y(y));
  ylabel('amplitude[Pa]');
  xlabel('time[sec]');
  xlim([t(1) t(end)]);
  ylim([-5 5]);
  ax = gca;
  ax.FontSize = setting_fontsize;

  subplot(3,1,2);
  [f,psx] = fps(wind_y(y),fs);
  plot(f/1e3,10*log10(psx/(20e-6).^2));
  ylabel('power spectrum[dB SPL]');
  xlabel('frequency[kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim([89 96]);
  ax = gca;
  ax.FontSize = setting_fontsize;

  subplot(3,1,3);
  [f,gx] = fpsd(wind_y(y),fs);
  plot(f/1e3,10*log10(gx));
  ylabel('PSD[dB/Hz]');
  xlabel('frequency[kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim([-5 10]);
  ax = gca;
  ax.FontSize = setting_fontsize;

  strtitle = 'POWER SPECTRUM[PURE SIGNAL]';
  sgtitle(strtitle, 'FontSize', setting_fontsize);

  %% save at frame
  F(n) = getframe(gcf);
  n = n + 1;

  %% close figure
  close all;

end

%% make video object
v = VideoWriter('step3_2_pure.mp4', 'MPEG-4');
v.FrameRate = 10;
open(v);
writeVideo(v,F);
close(v);

%% remove path
rmpath('../spectrum_lib/');

%% end
