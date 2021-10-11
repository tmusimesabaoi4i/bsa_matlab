% 信号のパワースペクトル密度
% https://www.onosokki.co.jp/HP-WK/eMM_back/emm148.pdf
% https://jp.mathworks.com/help/signal/ug/amplitude-estimation-and-zero-padding.html

%% start

function [f,gx] = fpsd_pad(x,fs)
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
  gx = psx ./ (f(2)-f(1));
end

%% end
