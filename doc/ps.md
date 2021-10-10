## パワーとエネルギーについて
皆さんはパワーとエネルギーの違いについて説明できますか？
そんなのは義務教育で習ったよ。という方がほどんどだと思います。
では以下のような定義域外はすべて0と仮定した、
周期信号のパワーとエネルギーをそれぞれ求めてください。
<img src="https://latex.codecogs.com/gif.latex?y(t)&space;=&space;\sqrt{2}&space;\sin{(20^3\pi&space;t)}&space;\mbox{&space;}&space;\{&space;t:0\leq&space;t&space;\leq&space;10&space;\}" />
求められましたか？
求められた方は少しお付き合いください。
実はこれを書いている本人も大学4年生になるまで求められませんでした。
それは定義を知らないからです。
皆さんがパワー、エネルギーと聞いたら物理の球を持ち上げるとか、
そういうことを想像すると思います。
僕もそうでした。そんなことでは信号のパワーなんて求められませんね。
基本的にパワーとは二乗平均値のことを指します。
そして、エネルギーとは二乗平均値に時間を乗じたものを指します。
なので、パワーを
<img src="https://latex.codecogs.com/gif.latex?P" />
エネルギーを
<img src="https://latex.codecogs.com/gif.latex?E" />
としたとき、

<img src="https://latex.codecogs.com/gif.latex?P&space;=&space;\frac{1}{T}&space;\int_{0}^{T}&space;|y(t)|^2&space;td&space;=&space;1&space;,&space;E&space;=&space;\int_{0}^{T}|y(t)|^2&space;td&space;=&space;10" />
となります。

## フーリエ変換、振幅スペクトル、位相スペクトル
ここで、フーリエ変換を行うとその信号の振幅情報と位相情報を取り出すことができます。

<img src="https://latex.codecogs.com/gif.latex?y(t)&space;=&space;\frac{1}{2}&space;\cos(4\times10^3\pi&space;t&space;-&space;\pi/4)&space;&plus;&space;\frac{3}{2}\cos(20\times10^3\pi&space;t&space;&plus;&space;\pi/3)&space;&plus;&space;\cos(30\times10^3\pi&space;t)" />
から振幅情報と位相情報を取り出してみましょう。取り出すと以下の図のようになります。
[code](../prog/ps/ex3.m)
<img src="../img/ps/cos_wave.png" />
コードの説明ですが、`Y = fft(y);`でフーリエスペクトルを求めています。
[MATLABの公式ドキュメント-fft](https://jp.mathworks.com/help/matlab/ref/fft.html)
に書かれていますが、求められる`Y`は両側スペクトルなので、片側スペクトルに変換を行っています。
また、フーリエスペクトルから複素フーリエ係数に変換した後に
片側スペクトル<img src="https://latex.codecogs.com/gif.latex?Z(f)" />
に対して、振幅スペクトルは<img src="https://latex.codecogs.com/gif.latex?|Z(f)|" />
であり、位相スペクトルは<img src="https://latex.codecogs.com/gif.latex?\tan^{-1}\left(\frac{Im\{Z(f)\}}{Re\{Z(f)\}}\right)" />
と表せられるので、それらを描写して振幅情報と位相情報を取り出しが出来ました。

## フーリエ変換、パワースペクトル
