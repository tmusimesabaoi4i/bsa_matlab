% 信号のパワースペクトル
% https://www.onosokki.co.jp/HP-WK/eMM_back/emm146.pdf
% https://jp.mathworks.com/help/signal/ug/amplitude-estimation-and-zero-padding.html

%% start

function [f,psx] = fps_pad(x,fs)
  padT = 100;
  lpad = fs*padT;
  N = length(x);
  xdft = fft(x,lpad);
  ck_temp = abs(xdft/N);
  ck = ck_temp(1:lpad/2+1);
  ck2 = ck.^2;
  psx = ck2;
  psx(2:end-1) = 2*psx(2:end-1);
  f = linspace(0,fs/2,length(psx));
end

%% end
