%% start

function [f,psx] = fps(x,fs)
  N = length(x);
  xdft = fft(x);
  ck_temp = abs(xdft/N);
  ck = ck_temp(1:N/2+1);
  ck2 = ck.^2;
  psx = ck2;
  psx(2:end-1) = 2*psx(2:end-1);
  f = linspace(0,fs/2,length(psx));
end

%% end
