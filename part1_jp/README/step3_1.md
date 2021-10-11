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
