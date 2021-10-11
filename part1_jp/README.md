# 目次
1. [利用する信号](#Step1)
1. [スペクトル解析](#Step2)
    1. [パワースペクトル](#Step2_1)
    1. [パワースペクトル密度](#Step2_2)
    1. [0パディングによるパワースペクトル](#Step2_3)
    1. [スペクトログラム](#Step2_4)
1. [変数の変更](#Step3)
    1. [録音時間を変更](#Step3_1)
    1. [サンプリング周波数を変更](#Step3_2)
<!--  -->
<a id="Step1"></a>
# 利用する信号
ここでは、利用する信号について説明します。

### 周期信号
周期信号には、振幅が
<img src="https://latex.codecogs.com/png.latex?%5Csqrt%7B2%7D">
であり、周波数が1[kHz]であるような信号を利用します。
この信号は校正機からの信号として解釈することができます。

![step1_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step1/step1_pure.png)

### 非周期信号
非周期信号には、パワーが約1ワット(0[dBW])であるような白色ガウスノイズを利用します。
この信号は、A/Dコンバータからの雑音だと解釈することができます。

![step1_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step1/step1_wgn.png)
<!--  -->
<a id="Step2"></a>
# 基本的なスペクトル解析

ここでは、

- パワースペクトル
- パワースペクトル密度
- 0パディングによるパワースペクトル
- スペクトログラム

などについて説明します。
<!--  -->
<a id="Step2_1"></a>
## パワースペクトル
スペクトル解析の目的は基本的に、パワースペクトルを導出することです。

パワースペクトルは、周波数の関数であり
元の時間信号に含まれる、周波数毎の単位時間あたりのエネルギーを知ることができます。

つまり、パワースペクトルを見ることによって、
その信号がどの周波数帯にどれほどのエネルギーを有しているかがわかります。

ここで、

- フーリエ係数
- 複素フーリエ係数

なども似たような性質を表す値なので気を付けましょう。

### 周期信号
![step2_1_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_1/step2_1_pure.png)

### 非周期信号
![step2_1_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_1/step2_1_wgn.png)

### 窓について
今回は、信号全体の前後10%に対して、cos形の窓をかける、
COS20ウィンドウを利用します。
COS20ウィンドウは、hamming、hanning taperよりも、スペクトルの漏れを減少させる効果は小さいが、
データの最初と最後の部分をより生かすテーパーです。

＊[スペクトル解析](https://www.amazon.co.jp/%E3%82%B9%E3%83%9A%E3%82%AF%E3%83%88%E3%83%AB%E8%A7%A3%E6%9E%90-%E6%97%A5%E9%87%8E-%E5%B9%B9%E9%9B%84/dp/4254121830)
の201pでも利用が推奨されているため、今回はCOS20ウィンドウを利用しました。

### 注意
信号に対して窓をかけるときは、
「[Amplitude Correction Factor](https://jp.mathworks.com/matlabcentral/answers/372516-calculate-windowing-correction-factor)」
を利用することを忘れないようにします。
もしも、「Amplitude Correction Factor」を忘れてしまった場合は、
正しい振幅値にならない可能性があります。
<a id="Step2_2"></a>
## パワースペクトル密度
周期性のないランダム信号のスペクトルは、連続スペクトルとなるため、
分析する周波数幅によって、パワーの値が変化します。
そのような場合は分析する周波数幅でパワースペクトルを割った、
パワースペクトル密度が利用されます。

### 周期信号
![step2_2_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_2/step2_2_pure.png)

### 非周期信号
![step2_2_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_2/step2_2_wgn.png)
<!--  -->
<a id="Step2_3"></a>
## 0パディングによるパワースペクトル
0パディングとは、解析したいデータに対して、
そのあとに0を加えてからフーリエ変換を行い、
スペクトル解析する手法です。

フーリエ変換後の周波数間隔は、
<img src="https://latex.codecogs.com/gif.latex?f_%7Bs%7D/N">
と表すことができます。

ここで、サンプリング周波数を小さくしてしまっては、
ナイキスト周波数が小さくなってしまいます。
ここで、データ点数を多くすることで、周波数間隔を狭くします。

周波数間隔を狭くするメリットは二つ考えられます。

- 離散スペクトルである周期信号と、連続スペクトルである非周期信号の違いを小さくする。
- 周波数ビンの個数を多くして、周波数の正弦波の振幅の推定(パワースペクトルの大きさ)の精度を向上させる。
<!--  -->
<a id="Step2_4"></a>
## スペクトログラム
スペクトログラムは周波数分析を時間的に連続して行い、
色によって強さを表すことで、強さ、周波数、時間の３次元表示を行うものです。

### 周期信号
![step2_4_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_4/step2_4_pure.png)

### 非周期信号
![step2_4_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step2_4/step2_4_wgn.png)
<!--  -->
<a id="Step3"></a>
# 変数の変更

スペクトル解析では、一般に、録音時間、サンプリング周波数、周波数間隔(周波数ビン)、信号点数が重要です。
ここで、それぞれの変数を変化させて場合にパワースペクトルやパワースペクトル密度がどのように変化するか確かめます。

一般に、録音時間、サンプリング周波数、周波数間隔(周波数ビン)、信号点数には、

<img src="https://latex.codecogs.com/gif.latex?%5Cbegin%7Balign*%7D%20f_s%20%26%3D%20%5Cfrac%7BL%7D%7BT%7D%20%3D%20L%20%5Ctimes%20%5CDelta%20f%20%5C%5C%20T%20%26%3D%20%5Cfrac%7B1%7D%7B%5CDelta%20f%7D%20%5Cend%7Balign*%7D">

という関係が成立します。

ここでは、一般に録音する際に変更が簡単な

1. 録音時間を変更した場合（ただし、サンプリング周波数は一定）。
1. サンプリング周波数を変更した場合（ただし、録音時間は一定）。

の二つの場合について考えたいと思います。
<!--  -->
<a id="Step3_1"></a>
## 録音時間を変更
一般に、録音時間、サンプリング周波数、周波数間隔(周波数ビン)、信号点数には、

<img src="https://latex.codecogs.com/gif.latex?%5Cbegin%7Balign*%7D%20f_s%20%26%3D%20%5Cfrac%7BL%7D%7BT%7D%20%3D%20L%20%5Ctimes%20%5CDelta%20f%20%5C%5C%20T%20%26%3D%20%5Cfrac%7B1%7D%7B%5CDelta%20f%7D%20%5Cend%7Balign*%7D">

という関係が成立します。

上記の関係から、

１．サンプリング周波数を一定で、録音時間を長くした場合、周波数間隔
<img src="https://latex.codecogs.com/gif.latex?%5CDelta%20f">
は短くなり、信号点数
<img src="https://latex.codecogs.com/gif.latex?L">
は多くなります。

２．サンプリング周波数を一定で、録音時間を短くした場合、周波数間隔
<img src="https://latex.codecogs.com/gif.latex?%5CDelta%20f">
は長くなり、信号点数
<img src="https://latex.codecogs.com/gif.latex?L">
は少なくなります。

### 周期信号
![step3_1_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step3_1/step3_1_pure.gif)

### 非周期信号
![step3_1_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step3_1/step3_1_wgn.gif)

### 0パディング
周波数間隔
<img src="https://latex.codecogs.com/gif.latex?%5CDelta%20f">
が録音時間の変化によって変化します。
そのことによって、1[kHz]での分解が正しく出来ない場合があるため、
周波数ビンの個数を多くして、周波数の正弦波の振幅の推定(パワースペクトルの大きさ)の精度を向上させます。

![step3_1_pure_pad](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step3_1/step3_1_pure_pad.gif)

### 考察
- サンプリング周波数を一定で録音時間を長くすると、
周期信号では周波数間隔の変化によって、
正しいスペクトル推定が行えない場合があります。
よって0パディングを行ったほうが良いことがわかります。

- サンプリング周波数を一定で録音時間を長くすると、
非周期信号では信号点数が多くなることから、
パワースペクトルが小さくなります。
しかし、スペクトル密度の大きさは変化しません。
<!--  -->
<a id="Step3_2"></a>
## サンプリング周波数を変更
一般に、録音時間、サンプリング周波数、周波数間隔(周波数ビン)、信号点数には、

<img src="https://latex.codecogs.com/gif.latex?%5Cbegin%7Balign*%7D%20f_s%20%26%3D%20%5Cfrac%7BL%7D%7BT%7D%20%3D%20L%20%5Ctimes%20%5CDelta%20f%20%5C%5C%20T%20%26%3D%20%5Cfrac%7B1%7D%7B%5CDelta%20f%7D%20%5Cend%7Balign*%7D">

という関係が成立します。

上記の関係から、

１．録音時間を一定で、サンプリング周波数を大きくした場合、周波数間隔
<img src="https://latex.codecogs.com/gif.latex?%5CDelta%20f">
は一定で、信号点数
<img src="https://latex.codecogs.com/gif.latex?L">
は多くなります。

２．録音時間を一定で、サンプリング周波数を小さくした場合、周波数間隔
<img src="https://latex.codecogs.com/gif.latex?%5CDelta%20f">
は一定で、信号点数
<img src="https://latex.codecogs.com/gif.latex?L">
は少なくなります。

### 周期信号
![step3_2_pure](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step3_2/step3_2_pure.gif)

### 非周期信号
![step3_2_wgn](https://github.com/tmusimesabaoi4i/Spectrum_Analysis_with_MATLAB/blob/main/part1_program/step3_2/step3_2_wgn.gif)

### 考察
- 録音時間を一定でサンプリング周波数を大きくすると、
非周期信号では信号点数が多くなることから、
パワースペクトル、パワースペクトル密度の大きさが小さくなります。
<!--  -->
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
# まとめ
- サンプリング周波数を一定で録音時間を長くすると、
周期信号では周波数間隔の変化によって、
正しいスペクトル推定が行えない場合があります。
よって0パディングを行ったほうが良いことがわかります。

- サンプリング周波数を一定で録音時間を長くすると、
非周期信号では信号点数が多くなることから、
パワースペクトルが小さくなります。
しかし、スペクトル密度の大きさは変化しません。

- 録音時間を一定でサンプリング周波数を大きくすると、
非周期信号では信号点数が多くなることから、
パワースペクトル、パワースペクトル密度の大きさが小さくなります。

# GitHub上で数式を表示する方法
1. [CODECOGS](https://www.codecogs.com/latex/eqneditor.php)にアクセスする。
1. 利用したい数式を打ち込む。
1. 下のほうにURLを生成するボックスがあるので、そこから画像のリンクを取得する。
<!--  -->
# 参考文献

### 計測コラム

- [ディジタル計測の基礎 - 第3回「時間波形と実効値」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm75.pdf)

- [ディジタル計測の基礎 - 第4回「時間波形と実効値（その２）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm76.pdf)

- [ディジタル計測の基礎 - 第8回「時間窓長とスペクトル分解能 」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm80.pdf)

- [ディジタル計測の基礎 - 第9回「いろいろな時間波形とスペクトル」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm81.pdf)

- [基礎からの周波数分析（2）?「フーリエ級数展開」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm126.pdf)

- [基礎からの周波数分析（3）?「フーリエ級数展開（その2）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm128.pdf)

- [基礎からの周波数分析（4）?「フーリエ変換」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm130.pdf)

- [基礎からの周波数分析（8)　「離散フーリエ変換（DFT）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm138.pdf)

- [基礎からの周波数分析（10）－「離散フーリエ変換（DFT)その2」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm142.pdf)

- [基礎からの周波数分析（11）－「フーリエスペクトル」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm144.pdf)

- [基礎からの周波数分析（12）－「パワースペクトル（その１）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm146.pdf)

- [基礎からの周波数分析 (13) －「パワースペクトル（その２）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm148.pdf)

- [基礎からの周波数分析（14）－「DFT（FFT）と時間窓」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm150.pdf)

- [基礎からの周波数分析（15）－「パワースペクトル（その３）」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm152.pdf)

- [基礎からの周波数分析（19）－「伝達関数とその図示方法」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm160.pdf)

- [基礎からの周波数分析（30）－「フーリエスペクトルとその用途」](https://www.onosokki.co.jp/HP-WK/eMM_back/emm183.pdf)

### 書籍

- [信号解析教科書- 信号とシステム](https://www.amazon.co.jp/%E4%BF%A1%E5%8F%B7%E8%A7%A3%E6%9E%90%E6%95%99%E7%A7%91%E6%9B%B8-%E4%BF%A1%E5%8F%B7%E3%81%A8%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0-%E5%8E%9F%E5%B3%B6-%E5%8D%9A/dp/4339009075/ref=pd_sbs_2/356-6424980-1736845?pd_rd_w=kFJBX&pf_rd_p=367c54b8-500b-4071-9b4d-65fe16192688&pf_rd_r=3EMVK4HT1E55SM031H6Q&pd_rd_r=f5fb6c53-b51d-4880-9883-30955a5ff139&pd_rd_wg=kfKWq&pd_rd_i=4339009075&psc=1)　、　原島 博　　、　出版日：2018年3月9日

- [信号解析:信号処理とデータ分析の基礎](https://www.amazon.co.jp/%E4%BF%A1%E5%8F%B7%E8%A7%A3%E6%9E%90-%E4%BF%A1%E5%8F%B7%E5%87%A6%E7%90%86%E3%81%A8%E3%83%87%E3%83%BC%E3%82%BF%E5%88%86%E6%9E%90%E3%81%AE%E5%9F%BA%E7%A4%8E-%E9%A6%AC%E6%9D%89-%E6%AD%A3%E7%94%B7/dp/462778631X)　、　馬杉 正男　　、　出版日：2013年4月20日

- [スペクトル解析](https://www.amazon.co.jp/%E3%82%B9%E3%83%9A%E3%82%AF%E3%83%88%E3%83%AB%E8%A7%A3%E6%9E%90-%E6%97%A5%E9%87%8E-%E5%B9%B9%E9%9B%84/dp/4254121830)　、　日野 幹雄 　　、　出版日：2010年7月1日

- [Pythonで学ぶフーリエ解析と信号処理](https://www.amazon.co.jp/Python%E3%81%A7%E5%AD%A6%E3%81%B6%E3%83%95%E3%83%BC%E3%83%AA%E3%82%A8%E8%A7%A3%E6%9E%90%E3%81%A8%E4%BF%A1%E5%8F%B7%E5%87%A6%E7%90%86-%E7%A5%9E%E6%B0%B8-%E6%AD%A3%E5%8D%9A/dp/4339009377)　、　神永 正博　　、　出版日：2020年9月9日


### MATLABサイト

- [ホワイト ガウス ノイズ サンプルの生成](https://jp.mathworks.com/help/comm/ref/wgn.html)

- [振幅推定とゼロ パディング](https://jp.mathworks.com/help/signal/ug/amplitude-estimation-and-zero-padding.html)

### その他Webサイト

- [数理地球科学基礎演習 II 時系列解析](https://park.itc.u-tokyo.ac.jp/tajika/class/kiso2/fourier1.pdf)　、　田近研究室

- [周波数領域における単変量解析（スペクトル解析）](https://www.sci.hokudai.ac.jp/~minobe/data_anal/chap3.pdf)　、　見延研究室

- [スペクトログラム](http://adlib.rsch.tuis.ac.jp/~akira/zemi/ocampus/html/specana.html)　、　西村研究室

- [GithubのREADMEとかwikiで数式を書く](http://idken.net/posts/2017-02-28-math_github/)
