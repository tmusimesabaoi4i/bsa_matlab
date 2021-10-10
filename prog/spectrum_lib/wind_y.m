% テューキー (コサインテーパー) ウィンドウ
% https://jp.mathworks.com/help/signal/ref/tukeywin.html
function [wind_x] = wind_y(x)
  wind = transpose(tukeywin(length(x), 1/4));
  alpha = length(wind) / sum(wind);
  wind_x = alpha * (x .* wind);
end
