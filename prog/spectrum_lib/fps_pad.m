%% start

function [f,psx] = fps_pad(x,fs)
  padT = 100;
  lpad = fs*padT;
  N = length(x);
  xdft = fft(x,uint32(lpad));
  ck_temp = abs(xdft/N);
  ck = ck_temp(1:lpad/2+1);
  ck2 = ck.^2;
  psx = ck2;
  psx(2:end-1) = 2*psx(2:end-1);
  f = linspace(0,fs/2,length(psx));
end

%% end
