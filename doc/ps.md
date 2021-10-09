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
ではサンプル音源から、振幅情報と位相情報を取り出してみましょう。[code](prog/ex1.m)
