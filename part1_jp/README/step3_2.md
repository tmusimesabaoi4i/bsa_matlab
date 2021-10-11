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
