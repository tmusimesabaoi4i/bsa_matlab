%% start

function [wind_x,ACF,ECF] = wind_y(x)
  wind = transpose(tukeywin(length(x), 1/5));
  wind_x = wind .* x;
  one = ones(size(x),'like',x);
  ACF = mean(one)/mean(wind);
  ECF = rms(one)^2/rms(wind)^2;
end

%% end
