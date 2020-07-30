---
title: 积分习题II:取整积分(中)
author: Aster
type: post
date: 2016-07-09T06:36:02+00:00
url: /2016/07/colletion_integrate_2/
featured_image: /wp-content/uploads/2016/06/colletion_integrate_2_BG-100x75.jpg
duoshuo_thread_id:
  - "6373465170101928706"
categories:
  - 数学题集
tags:
  - 取整函数
  - 收集
  - 积分习题

---
来看看几个取整函数结合的题:

试计算:

$$I(n) = \int_0^n {{{\left\lfloor x \right\rfloor }^2} - {{\{ x\} }^2}} dx\quad n \in {\mathbb{Z}\_ + }$$  
<!--more-->

* * *

解:

$$\begin{aligned}  
I(n)  
&= \sum_{k = 0}^{n - 1} {\int_k^{k + 1} {{{ \lfloor x \rfloor }^2} - {{\{ x\} }^2}} } dx\\  
&= n\int_0^1 {{x^2}} dx - \sum_{k = 0}^{n - 1} {{k^2}}\\  
&= \frac{1}{3}n - \frac{1}{6}(n - 1)n(2n - 1)\\  
&= - \frac{1}{6}\left( {2{n^3} - 3{n^2} - n} \right)\quad\square  
\end{aligned}$$

使用这个方法我们可以计算出:

$$\begin{aligned}  
\int_0^n {{{\left\lceil x \right\rceil }^2}} dx &= \frac{1}{6}\left( {2{n^3} + 3{n^2} + n} \right)\\  
\int_0^n {{{\left\lfloor x \right\rfloor }^2}} dx &= \frac{1}{6}\left( {2{n^3} - 3{n^2} + n} \right)\\  
\int_0^n {{{\{ x\} }^2}} dx &= \frac{1}{3}n  
\end{aligned}$$

* * *

然后根据一些变换可以求出其他的积分,比如

$$\begin{aligned}  
{x^2} &= {\left( {\{ x\} + \left\lfloor x \right\rfloor } \right)^2}\\  
\{ x\} \left\lfloor x \right\rfloor &= \frac{1}{2}\left( {{x^2} - {{\{ x\} }^2} - {{\left\lfloor x \right\rfloor }^2}} \right)\\  
\int_0^n {\{ x\} } \left\lfloor x \right\rfloor dx &= \frac{1}{6}{n^3} - \frac{1}{2}\int_0^n {{{\{ x\} }^2}} + {\left\lfloor x \right\rfloor ^2}dx\\  
&= \frac{1}{4}(n - 1)n\quad\square  
\end{aligned}$$

同理

$$\begin{aligned}  
\left\lceil x \right\rceil - \left\lfloor x \right\rfloor &= f(x) = \left\{ {\begin{array}{*{20}{l}}  
0&{x \in \mathbb{Z}} \\  
1&{x\not \in \mathbb{Z}}  
\end{array}} \right.\\  
\left\lceil x \right\rceil \left\lfloor x \right\rfloor &= \frac{1}{2}\left( {{f^2}(x) - {{\left\lceil x \right\rceil }^2} - {{\left\lfloor x \right\rfloor }^2}} \right)\\  
\int_0^n {\left\lceil x \right\rceil \left\lfloor x \right\rfloor dx} &= {n^3} - \frac{1}{2}\int_0^n {{{\left\lceil x \right\rceil }^2}} + {\left\lfloor x \right\rfloor ^2}dx\\  
&= \frac{1}{3}({n^3} - n)\quad\square  
\end{aligned}$$

来道习题吧,求证:

$$\bigstar \quad\int_0^n {\left\{ x \right\}\left\lceil x \right\rceil \left\lfloor x \right\rfloor dx}  = \frac{1}{6}({n^3} - n)$$

* * *

Ok,我们来算点其他的

$$\int_0^1 x \left\lceil {\frac{1}{x}} \right\rceil \left\{ {\frac{1}{x}} \right\}{\mkern 1mu} dx$$

我们已经知道这两个恒等式了:

$$\begin{aligned}  
\left\{ x \right\} &= x - \lfloor x \rfloor\\  
f(x)& = \lceil x \rceil - \lfloor x \rfloor = \left\{ {\begin{array}{*{20}{l}}  
0&{x \in \mathbb{Z}} \\  
1&{x\not \in \mathbb{Z}}  
\end{array}} \right.  
\end{aligned}$$

所以

$$\begin{aligned}  
I&=\int_0^1 x \left\lceil {\frac{1}{x}} \right\rceil \left\{ {\frac{1}{x}} \right\}{\mkern 1mu} dx\\  
&= \int_0^1 x (1 + \left\lfloor {\frac{1}{x}} \right\rfloor )(\frac{1}{x} - \left\lfloor {\frac{1}{x}} \right\rfloor ){\mkern 1mu} dx\\  
&= \int_1^\infty {\frac{1}{y}} (1 + \left\lfloor y \right\rfloor )(y - \left\lfloor y \right\rfloor ){\mkern 1mu} \frac{{dy}}{{{y^2}}}\\  
&= \sum_{n = 1}^\infty {\int_n^{n + 1} {\frac{1}{{{y^3}}}} } (1 + n)(y - n){\mkern 1mu} dy\\  
&= \frac{1}{2}\sum\limits_{n = 1}^\infty {\frac{1}{{n(n + 1)}}} \\  
&= \frac{1}{2}\quad\square  
\end{aligned}$$

* * *

为何只算定积分呢?因为一般形式的不定积分实在是太烦了

$$\int { \lfloor x \rfloor } {\text{d}}x = x \lfloor x \rfloor  - \frac{{ \lfloor x \rfloor ( \lfloor x \rfloor  + 1)}}{2}$$

只有限定了整数到整数的定积分才能有比较看得下去的结论.

$$\begin{aligned}  
\int_0^n {{{ \lceil x \rceil }^p}} {\mkern 1mu} dx &= {n^p} + \frac{{{B\_{p + 1}}(n) - {B_{p + 1}}}}{{p + 1}}\\  
\int_0^n {{{ \lfloor x \rfloor }^p}} {\mkern 1mu} dx &= \frac{{{B\_{p + 1}}(n) - {B_{p + 1}}}}{{p + 1}}\\  
\int_0^n {{{ \lfloor x \rceil }^p}} {\mkern 1mu} dx &= \frac{{{n^p}}}{2} + \frac{{{B\_{p + 1}}(n) - {B_{p + 1}}}}{{p + 1}}\\  
\int_0^n {{{\{ x\} }^p}} {\mkern 1mu} dx &= \frac{n}{{p + 1}}  
\end{aligned}$$

附上计算机验证:

<pre class="" lang:haskell="" decode:true="">(*上取整函数*)
Table[{p,FindSequenceFunction[Table[Integrate[Ceiling[n]^p,{n,0,i}],{i,1,20}],n]},{p,1,10}]//TableForm
FullSimplify@Table[{p,n^p+(BernoulliB[p+1,n]-BernoulliB[p+1])/(p+1)},{p,1,10}]//TableForm
(*取整函数*)
Table[{p,FindSequenceFunction[Table[Integrate[Floor[n]^p,{n,0,i}],{i,1,20}],n]},{p,1,10}]//TableForm
Cancel@Table[{p,(BernoulliB[p+1,n]-BernoulliB[p+1])/(p+1)},{p,1,10}]//TableForm
(*舍入函数*)
Table[{p,FindSequenceFunction[Table[Integrate[Round[n]^p,{n,0,i}],{i,1,20}],n]},{p,1,10}]//TableForm
FullSimplify@Table[{p,(BernoulliB[p+1,n]-BernoulliB[p+1])/(p+1)+n^p/2},{p,1,10}]//TableForm
(*取小数函数*)
Table[{p,FindSequenceFunction[Table[Integrate[SawtoothWave[n]^p,{n,0,i}],{i,1,20}],n]},{p,1,10}]//TableForm
FullSimplify@Table[{p,n/(p+1)},{p,1,10}]//TableForm</pre>

不限定整数的话,那就麻烦了.Floor是能求的,然后剩下的应该也能求了.

$$\begin{aligned}  
\int {\left\lfloor x \right\rfloor dx} &= \left\lfloor x \right\rfloor \left( {x - \frac{{\left\lfloor x \right\rfloor + 1}}{2}} \right)\\  
\int {\left\lfloor x \right\rfloor dx} &= \int { \lfloor x - \frac{1}{2} \rceil dx} = \int {\left\lceil {x - 1} \right\rceil dx} \\  
\int {\left\{ x \right\}dx} &= \int {x - \left\lfloor x \right\rfloor dx} = \frac{1}{2}{x^2} + \int {\left\lfloor x \right\rfloor dx}  
\end{aligned}$$

极值点有点不对,不过无所谓了,这积分太难搞了,我不想推了.

<img class="" alt="" width="" height="" /><img class="alignnone size-full wp-image-226" src="http://geis.xyz/wp-content/uploads/2016/06/Guass_Integrate.png" alt="" width="576" height="544" /> 

<pre class="lang:default decode:true">data=Transpose@Table[{
  Integrate[Floor[t],{t,0,n}],
  Integrate[Ceiling[t],{t,0,n}],
  Integrate[Round[t],{t,0,n}],
  Integrate[SawtoothWave[t],{t,0,n}]
},{n,0,10,0.1}];
png=GraphicsGrid[{{Plot[{Floor[t],Ceiling[t],Round[t],SawtoothWave[t]},{t,0,10},AspectRatio-&gt;1/2,PlotTheme-&gt;"Web",PlotLegends-&gt;{"Floor","Ceiling","Round","SawtoothWave"},ImageSize-&gt;{400,400}]},{ListLinePlot[data,AspectRatio-&gt;1/2,PlotTheme-&gt;"Web",PlotLegends-&gt;{"$$Integral]Floor","$$Integral]Ceiling","$$Integral]Round","$$Integral]SawtoothWave"},ImageSize-&gt;400]}},AspectRatio-&gt;1/2,ImageSize-&gt;Large]
Export["Guass_Integrate.png",png,Background-&gt;None];</pre>
