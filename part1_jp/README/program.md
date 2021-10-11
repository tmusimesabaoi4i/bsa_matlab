# プログラム

### パワースペクトルを計算
```:fps.m
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
```

### パワースペクトル密度を計算
```:fpsd.m
function [f,gx] = fpsd(x,fs)
  N = length(x);
  xdft = fft(x);
  ck_temp = abs(xdft/N);
  ck = ck_temp(1:N/2+1);
  ck2 = ck.^2;
  psx = ck2;
  psx(2:end-1) = 2*psx(2:end-1);
  f = linspace(0,fs/2,length(psx));
  gx = psx ./ ( f(2) - f(1) );
end
```

### 0パディングを行って、パワースペクトルを計算
```:fps_pad.m
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
```

### 0パディングを行って、パワースペクトル密度を計算
```:fps_pad.m
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
```

### COS20ウィンドウをかける関数
```:wind_y.m
function [wind_x] = wind_y(x)
  wind = transpose(tukeywin(length(x), 1/5));
  alpha = 1 / ( sum(wind) / length(wind) );
  wind_x = alpha * (x .* wind);
end
```
