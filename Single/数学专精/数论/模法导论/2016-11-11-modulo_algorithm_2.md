---
title: 模法导论(下)
author: Aster
type: post
date: 2016-11-11T14:22:22+00:00
url: /2016/11/modulo_algorithm_2/
featured_image: /wp-content/uploads/2016/11/modulo_algorithm_2_a-1-100x26.jpeg
page_preloader:
  - 'false'
theme_header_style:
  - "1"
theme_header_align:
  - left
theme_toolbar_toggle:
  - 'true'
background_selector_orientation:
  - full_width_layout
body_color_gradient:
  - single
body_color_gradient_style:
  - linear
body_color_gradient_angle:
  - vertical
body_size:
  - 'false'
body_source:
  - no-image
body_parallax:
  - 'false'
page_color_gradient:
  - single
page_color_gradient_style:
  - linear
page_color_gradient_angle:
  - vertical
page_size:
  - 'false'
page_source:
  - no-image
page_parallax:
  - 'false'
header_color_gradient:
  - single
header_color_gradient_style:
  - linear
header_color_gradient_angle:
  - vertical
header_size:
  - 'false'
header_source:
  - no-image
header_parallax:
  - 'false'
banner_color_gradient:
  - single
banner_color_gradient_style:
  - linear
banner_color_gradient_angle:
  - vertical
banner_size:
  - 'false'
banner_source:
  - no-image
banner_parallax:
  - 'false'
footer_color_gradient:
  - single
footer_color_gradient_style:
  - linear
footer_color_gradient_angle:
  - vertical
footer_size:
  - 'false'
footer_source:
  - no-image
footer_parallax:
  - 'false'
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - 模运算
  - 科普

---
# 高阶模法

  * 幂塔求模

下面是本模导书的重点所在了.所谓幂塔就是形如${a^{{b^c}}}$的存在,基本上c稍微大一点就是算不出来的了.大丈夫,我们不是有上面的欧拉幂模定理大法吗?

例:求4^5^6的最后两位.

$$\begin{aligned}  
&\quad \ {4^{{5^6}}}\bmod 100\\  
&= {4^{{5^6}\bmod \varphi (100)}}\bmod 100\\  
&= {4^{15625\bmod 40}}\bmod 100\\  
&= {4^{25}}\bmod 100 \\  
&= 4{({4^{12}}\bmod 100)^2}\bmod 100\\  
&= 4{\left( {{{\left( {4096\bmod 100} \right)}^2}\bmod 100} \right)^2}\bmod 100\\  
&= \cdots = 24\quad\textbf{Wrong process!}  
\end{aligned}$$

<!--more-->

这题很巧,就算用了错误的方法答案还是对的,3^4^5mod12就能让你得0分,而且据我所知高考的时候答案对过程全错只有两分安慰分...

都说了**只有a,n互质才能用欧拉幂模大法**...

那这个定理岂不是很弱鸡?求尾数难道所有偶数底都只能拉出去枪毙?

说了多少遍,有火灾灭火,没火灾就去点燃啊.令

$\left\{ \begin{gathered}  
g = \gcd (a,n)\\  
a = g \times d\\  
n = g \times f\\  
\end{gathered} \right.$

$\begin{aligned}  
{a^{{b^c}}}\,\bmod \,n &= {g^{{b^c}}} \times {d^{{b^c}}}\,\bmod \,(g \times f)\\  
&= (g \times ({g^{{b^c} - 1}}{d^{{b^c}}}\,\bmod \,f))\,\bmod \,n\\  
&= \left( {g \times \left( {\left( {{g^{{b^c} - 1}}\bmod \,f} \right)\left( {{d^{{b^c}}}\bmod \,f} \right)\,\bmod \,f} \right)\,} \right)\bmod \,n\\  
&= \left( {g \times \left( {\left( {{g^{{b^c}\bmod \,\varphi (f) - 1}}\bmod \,f} \right)\left( {{d^{{b^c}\bmod \,\varphi (f)}}\bmod \,f} \right)\,\bmod \,f} \right)\,} \right)\bmod \,n  
\end{aligned}$

这样就把问题递归掉了.

话是这么讲,但是写程序的时候还是要点小优化的.假定幂塔用一个向量表示.代码写出来大概如此:

<pre class="lang:mathematica decode:true" title="幂塔快速模">(*覆写优化幂模函数*)
Unprotect[PowerMod];
PowerMod[x_,y_,z_]:=1/;x==1||z==1;
(*ET=ExponentialTower*)
ETMod[{a_},n_]:=Mod[a,n];
ETMod[{a_,b_},n_]:=PowerMod[a,b,n];
ETMod[list_?VectorQ,n_]:=Block[
  {a=First@list,bc=Rest@list,g,d,f},
  g=GCD[a,n];d=a/g;f=n/g;
  If[a==1||n==1,Return[1]];
  If[g==1,Return[PowerMod[a,ETMod[bc,EulerPhi[n]],n]]];
  Mod[gMod[PowerMod[g,Mod[(ETMod[bc,EulerPhi[f]]-1),
    EulerPhi[f]],f]PowerMod[d,ETMod[bc,EulerPhi[f]],f],f],n]];</pre>

---

葛立恒数后8位是64195387,诸位一定很感兴趣这是怎么算出来的.这个数照理是无法形容的大,计算机怎么可能算得出来.

  * 超幂运算取模

其实很容易想到,因为欧拉函数定义在整数上,然后他又要严格单调递减,那么不断迭代迟早收敛到不动点1,N mod 1=1,N有多大就不用管了.

再说欧拉函数是个积性函数,变成1需要的迭代次数不会多的.设需要的次数为序列${a_n}$,分析下可知:

$$\begin{aligned}  
&{a\_n} = {a\_{\varphi (n)}} + 1\\  
&{\log \_3}n < {a\_n} < {\log _2}n  
\end{aligned} $$

所以我写的代码里覆写掉了Mathematica自带的PowerMod,这样就限制了递归深度.简单的说,对于任意一个超运算,我们只要计算下欧拉函数迭代到1的长度,然后直接截断就行了.

也就是说计算复杂度其实只和模数有关而和底数几乎无关.平均来说迭代深度就是位数乘3.

---

题图为复平面上的平方模迭代.不要强迫症去改绘图区域,会导致图像断裂,代码如下:

<pre class="lang:mathematica decode:true ">z0=Table[x+I y,{x,-3.001,3,0.01},{y,-3.002,3,0.01}];
results=Rest@NestList[Mod[#^2,2]&,z0,4];
data=GraphicsRow[Image@Rescale@Abs@#&/@results,ImageSize->600]
Export["jpeg.jpeg",data,Background->None];</pre>