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
