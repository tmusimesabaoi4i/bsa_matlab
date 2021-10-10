%% start

%% Initialization
close all;
clc;
clear;

%% Add path
addpath('spectrum_lib/');

%% Plot setting
lim = { [-2 2] , [-25 125] , [-100 25] };
setting_fontsize = 16;

%% File name
filename ='../img/v1_pad_pure';

%% For sentence
A = sqrt(2);
freq = 1e3;
a_T = linspace(1,5,50);
fs = 44.1e3;

%% Make frame object
F = struct('cdata',[],'colormap',[]);
n = 1;

%% Pre-allocation
pure_ps = zeros(size(a_T),'like',a_T);

for T = a_T

  %% Create vector
  t = 0 : 1/fs : T - 1/fs;
  y = A * sin(2 * pi * freq * t);

  [y,ACF,ECF] = wind_y(y);
  y = ACF * y;

  %% Plot signal
  figure('position', [0, 0, 600*16/9, 600]);

  subplot(3,1,1);
  plot(t,y);
  ylabel('amplitude [Pa]');
  xlabel('time [sec]');
  xlim([t(1) t(end)]);
  ylim(lim{1});
  ax = gca;
  ax.FontSize = setting_fontsize;

  subplot(3,1,2);
  [f,psx] = fps_pad(y,fs);
  plot(f/1e3,10*log10(psx/(20e-6).^2));
  ylabel('PS [dB SPL]');
  xlabel('Frequency [kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim(lim{2});
  ax = gca;
  ax.FontSize = setting_fontsize;

  pure_ps(n) = max(10*log10(psx/(20e-6).^2));

  subplot(3,1,3);
  [~,gx] = fpsd_pad(y,fs);
  plot(f/1e3,10*log10(gx));
  ylabel('PSD [dB/Hz]');
  xlabel('Frequency [kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim(lim{3});
  ax = gca;
  ax.FontSize = setting_fontsize;

  %% Save at frame
  F(n) = getframe(gcf);
  n = n + 1;

  %% Close figure
  close all;
end

%% Make video object
v = VideoWriter([filename '.mp4'],'MPEG-4');
v.FrameRate = 10;
open(v);
writeVideo(v,F);
close(v);

%% Plot signal
figure('position', [0, 0, 600*16/9, 600]);
plot(a_T,pure_ps);
ylabel('PS [dB SPL]');
xlabel('Recording time [sec]');
xlim([a_T(1) a_T(end)]);
ylim([90 94]);
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [filename '.png'] , 'Resolution', 500);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
close all;
clc;
clear;

%% Plot setting
lim = { [-5 5] , [0 100] , [-60 0] };
setting_fontsize = 16;

%% File name
filename ='../img/v1_pad_wgn';

%% For sentence
a_T = linspace(1,5,50);
fs = 44.1e3;

%% Make frame object
F = struct('cdata',[],'colormap',[]);
n = 1;

%% Pre-allocation
wgn_ps = zeros(size(a_T),'like',a_T);
wgn_psd = zeros(size(a_T),'like',a_T);

for T = a_T

  %% Create vector
  t = 0 : 1/fs : T - 1/fs;
  y = wgn(length(t),1,0);

  [y,ACF,ECF] = wind_y(y');
  y = ACF * y;

  %% Plot signal
  figure('position', [0, 0, 600*16/9, 600]);

  subplot(3,1,1);
  plot(t,y);
  ylabel('amplitude [Pa]');
  xlabel('time [sec]');
  xlim([t(1) t(end)]);
  ylim(lim{1});
  ax = gca;
  ax.FontSize = setting_fontsize;

  subplot(3,1,2);
  [f,psx] = fps_pad(y,fs);
  plot(f/1e3,10*log10(psx/(20e-6).^2));
  ylabel('PS [dB SPL]');
  xlabel('Frequency [kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim(lim{2});
  ax = gca;
  ax.FontSize = setting_fontsize;

  wgn_ps(n) = 10*log10(mean(psx)/(20e-6).^2);

  subplot(3,1,3);
  [~,gx] = fpsd_pad(y,fs);
  plot(f/1e3,10*log10(gx));
  ylabel('PSD [dB/Hz]');
  xlabel('Frequency [kHz]');
  xlim([f(1)/1e3 f(end)/1e3]);
  ylim(lim{3});
  ax = gca;
  ax.FontSize = setting_fontsize;

  wgn_psd(n) = 10*log10(mean(gx));

  %% Save at frame
  F(n) = getframe(gcf);
  n = n + 1;

  %% Close figure
  close all;
end

%% Make video object
v = VideoWriter([filename '.mp4'],'MPEG-4');
v.FrameRate = 10;
open(v);
writeVideo(v,F);
close(v);

%% Plot signal
figure('position', [0, 0, 600*16/9, 600]);
subplot(2,1,1);
plot(a_T,wgn_ps);
ylabel('PS [dB SPL]');
xlabel('Recording time [sec]');
xlim([a_T(1) a_T(end)]);
ylim([40 55]);
ax = gca;
ax.FontSize = setting_fontsize;
subplot(2,1,2);
plot(a_T,wgn_psd);
ylabel('PSD [dB/Hz]');
xlabel('Recording time [sec]');
xlim([a_T(1) a_T(end)]);
ylim([-32 -22]);
ax = gca;
ax.FontSize = setting_fontsize;

%% Save as png
fig = gcf;
exportgraphics(fig, [filename '.png'] , 'Resolution', 500);

%% Remove path
rmpath('spectrum_lib/');

%% end
