---
title: 积分习题I:取整积分(上)
author: Aster
type: post
date: 2016-07-08T05:35:26+00:00
url: /2016/07/colletion_integrate_1/
featured_image: /wp-content/uploads/2016/06/colletion_integrate_1_BG-100x75.jpg
duoshuo_thread_id:
  - "6373465170030625538"
categories:
  - 数学题集
tags:
  - 取整函数
  - 收集
  - 积分习题

---
先来给出取整函数的定义,取整函数有两个,上取整函数$\left\lceil x \right\rceil $和下取整函数$\left\lfloor x \right\rfloor $,然后可以组合出取小数函数$\left\{ x \right\}$和舍入函数$ \lfloor x \rceil $.其中取小数函数是个周期函数,就是个三角波,所以我们可以用傅里叶展开它.有时候实在搞不清题目在说什么玩意儿就统统展开再算.

$$\begin{aligned}  
\lfloor x\rfloor &=\max\{n\in \mathbb {Z} \mid n\leq x\} \\  
\lceil x\rceil &=\min\{n\in \mathbb {Z} \mid n\geq x\}\\  
\left\{ x\right\} &= x - \lfloor x\rfloor\\  
\{x\}&={\frac {1}{2}}-{\frac {1}{\pi }}\sum _{k=1}^{\infty }{\frac {\sin(2\pi kx)}{k}}  
\end{aligned}$$

<!--more-->

* * *

先来道题目练练手:

$$I = \int_0^1 {({x^2} + 1){\mkern 1mu} {\text{d}}\left\lfloor x \right\rfloor } $$

这是什么鬼,${{\text{d}}\left\lfloor x \right\rfloor }$我没学过啊,这玩意儿还能求导?

大丈夫,看把你吓得,直接上分部积分:

$$\begin{aligned}  
I &= \int_0^1 {({x^2} + 1){\mkern 1mu} {\text{d}}\left\lfloor x \right\rfloor } \\  
&= \left. {({x^2} + 1) \lfloor x \rfloor } \right|\_0^1 - \int_0^1 { \lfloor x \rfloor } d({x^2} + 1) \\  
&= 2 - 2\int_0^1 { \lfloor x \rfloor {\mkern 1mu} } xdx \\  
&= 2 - 0 = 2  
\end{aligned}$$

哇,不对吧,不能这样的吧,well defined之前怎么能直接瞎积分啊.

说得好,这个要用黎曼·斯蒂尔杰斯积分(<a>Riemann–Stieltjes Integral</a>)来定义,所以这是道超纲题,上面的解法也是错的...答案是对的有啥用...

RS积分给出了一个函数对于另一个函数积分的定义和计算方法.

这里模仿黎曼积分粗略的给出一个定义,对于

$$\int_a^b f (x){\text{d}}g(x)$$

作任意划分

$${\cal P}:\quad a=x\_0<x\_1<\ldots<x_n=b$$

若下列和的极限存在且相等那就等于积分值.

$$S(f,g,P): = \sum_{i = 1}^n f ({\xi \_i})(g({x\_i}) - g({x\_{i - 1}})\;$$

详细定义还是看书上比较好,有个推论:如果ƒ(x)关于g(x)可积，则g(x)关于ƒ(x)也必可积,此时有分部积分公式,所以上面的做法也不算完全错误.

好处是根据${\left\lfloor x \right\rfloor }$的间断性质,直接求ƒ(0)+ƒ(1)就行了.至于${{\text{d}}\left\lfloor x \right\rfloor }$到底是啥...这个去问Mathematica吧,我也不知道.

至少提示了我们一种积分思路,**根据取整积分的性质,积分可以分割为一段段整数的区间来求和.**

* * *

感觉我说了句废话,积分不是本来就是这么积的吗...算了,看题吧.

$$\int_0^1 {\left\lceil {\frac{1}{x}} \right\rceil  - \left\lfloor {\frac{1}{x}} \right\rfloor } {\mkern 1mu} {\text{d}}x$$

这个怎么切割呢?显然的

$$ \lceil x \rceil - \lfloor x \rfloor = \left\{ {\begin{array}{*{20}{l}}  
0&{x \in \mathbb{Z}} \\  
1&{x\not \in \mathbb{Z}}  
\end{array}} \right.$$

所以

$$\begin{aligned}  
I &= \int_0^1 {\left\lceil {\frac{1}{x}} \right\rceil - \left\lfloor {\frac{1}{x}} \right\rfloor } {\mkern 1mu} dx \\  
&= \int_{1/2}^1 1 {\mkern 1mu} dx + \int_{1/3}^{1/2} 1 {\mkern 1mu} dx + \int_{1/3}^{1/4} 1 {\mkern 1mu} dx + \cdots \\  
&= (1 - \frac{1}{2}) + (\frac{1}{2} - \frac{1}{3}) + (\frac{1}{3} - \frac{1}{4}) + \cdots \\  
&= \mathop {\lim }\limits_{m \to \infty } 1 - \frac{1}{i} \\  
&= 1  
\end{aligned}$$

* * *

好的以此类推来看看这道题:求证

$$\int_0^1 {{{\left( { - 1} \right)}^{^{\left\lfloor {\frac{1}{x}} \right\rfloor }}}} {\text{d}}x = 1 - \ln 4$$

证:

$$\begin{aligned}  
\int_0^1 \left(-1\right)^{^{\left\lfloor\frac{1}{x}\right\rfloor}} dx  
&=\int_\frac{1}{2}^1\left(-1\right)^1dx+\int_\frac{1}{3}^\frac{1}{2}\left(-1\right)^2dx+\int_\frac{1}{4}^\frac{1}{3}\left(-1\right)^3dx+\int_\frac{1}{5}^\frac{1}{4}\left(-1\right)^4dx+\ldots \\  
&=\left(-1+\frac{1}{2}\right)+\left(\frac{1}{2}-\frac{1}{3}\right)+ \left(-\frac{1}{3}+\frac{1}{4}\right)+\left(\frac{1}{4}-\frac{1}{5}\right)+\ldots \\  
&=-1+2\left(\frac{1}{2}-\frac{1}{3}+\frac{1}{4}-\frac{1}{5}+\ldots\right)\\  
&=-1+2(1-\log2)\\  
&=1-\log 4 \quad \square  
\end{aligned}$$

* * *

最后看一道长相类似的题:

求证:

$$\int_0^1 {\frac{1}{x} - \left\lfloor {\frac{1}{x}} \right\rfloor } dx = 1 - \gamma $$

证:

$$\begin{aligned}  
I &= \mathop {\lim }\limits\_{k \to \infty } {I\_k}\\  
{I\_k} &= \int_{\frac{1}{k}}^1 {\left( {\frac{1}{x} - \left\lfloor {\frac{1}{x}} \right\rfloor } \right)} dx\\  
&= \sum_{i = 1}^{k - 1} {\int_{\frac{1}{{i + 1}}}^{\frac{1}{i}} {\left( {\frac{1}{x} - i} \right)} } dx\\  
&= \sum_{i = 1}^{k - 1} {\left[ {\ln (x) - ix} \right]\_{\frac{1}{{i + 1}}}^{\frac{1}{i}}} \\  
I &= \mathop {\lim }\limits\_{k \to \infty } \left( {\ln (k) - \sum_{i = 2}^k {\frac{1}{i}} } \right) = 1 - \gamma  
\end{aligned}$$

**要说的是上述很多积分都是反常积分,单独把某个部分拎出来可能导致积不出来或者定义失效给出错误的答案,还有有的题奇点需要说明下我也略过了,奇点值的讨论都不难,自己脑补一下吧.**
