---
title: 积分习题VI:参数积分
author: Aster
type: post
date: 2016-12-22T15:23:22+00:00
url: /2016/12/colletion_integrate_6/
featured_image: /wp-content/uploads/2016/12/colletion_integrate_6_BG-100x40.jpg
duoshuo_thread_id:
  - "6377278182038438657"
categories:
  - 数学题集
tags:
  - 参数积分
  - 战力
  - 积分

---
有时候很多定积分不是很好算,但是转化为参积分就会好的多:

一个经典的例子就是:

$$\int_{0}^{\infty} \mathrm{e}^{-x^2}\, dx = \frac{\sqrt \pi}{2}$$

别告诉我你不知道这玩意儿怎么积出来的....

<!--more-->

$$\begin{aligned}  
I &= \int_{ - \infty }^{ + \infty } {{e^{ - {x^2}}}} {\text{dx}}\\  
{I^2} &= \int_{ - \infty }^{ + \infty } {{e^{ - {x^2}}}} {\text{dx}}\int_{ - \infty }^{ + \infty } {{e^{ - {y^2}}}} {\text{dy}}\\  
&= \int_{ - \infty }^{ + \infty } {\int_{ - \infty }^{ + \infty } {{e^{ - ({x^2} + {y^2})}}} } {\text{dx}}\;{\text{dy}}\\  
&= \int_0^{ + 2\pi } {\int_0^{ + \infty } {{e^{ - {r^2}}}} } r{\text{dr}}\;{\text{d}}\theta \\  
&= 2\pi \int_0^{ + \infty } {{e^{ - u}}} {\text{du}}/2 = \pi \\  
\Rightarrow I &= \sqrt \pi  
\end{aligned}$$

其实吧,用参积分更简单:

$$I(n) = \int_0^\infty  {{e^{ - {x^n}}}} \; {\text{d}}x$$

$$\begin{aligned}  
{I\_n} &= \int_0^{ + \infty } {{e^{ - {x^n}}}} dx\quad {\color{Blue}{ t \mapsto {x^n}}}\\  
&= \int_0^{ + \infty } {{e^{ - t}}} {t^{\frac{1}{n} - 1}}\frac{1}{n}dt\\  
&= \frac{1}{n}\Gamma \left( {\frac{1}{n}} \right)  
\end{aligned}$$

* * *

计算:

$$I = \int_0^1 {\frac{{{x^2} - 1}}{{\ln x}}} {\text{d}}x$$

定义一个函数:

$$\begin{aligned}  
I(a) &= \int_0^1 {\frac{{{x^a} - 1}}{{\ln x}}} dx\\  
I'(a) &= \int_0^1 {\frac{{{x^a}\ln x}}{{\ln x}}} dx = \int_0^1 {{x^a}} dx\\  
I(a) &= \int_0^x {\frac{1}{{1 + a}}da} = \ln (n + 1)  
\end{aligned}$$

ok令$a=2$搞定.

那么推广一下,求这个:

$$I = \int_0^1 {\frac{{{x^2} - \sqrt x }}{{\ln x}}} dx$$

一样定义一个函数,不过方法有点不一样:

$$\begin{aligned}  
I(a,b) &= \int_0^1 {\frac{{{x^b} - {x^a}}}{{\ln x}}} dx\\  
&= \int_0^1 {\left[ {\int_a^b {{x^y}} dy} \right]dx} \\  
&= \int_a^b {\left[ {\int_0^1 {{x^y}} dx} \right]dy} \\  
&= \int_a^b {\frac{1}{{y + 1}}} dy\\  
&= \ln \left( {\frac{{b + 1}}{{a + 1}}} \right)  
\end{aligned}$$

然后代值进去就好了.

* * *

有个类似的积分:

$$\int_0^1 {\frac{{{x^{1/2}} - {x^{ - 1/2}}}}{{x - 1}}} {\text{d}}x = 2$$

还是参数化,试着证明:

$$I(a) = \int_0^1 {\frac{{{x^a} - {x^{ - a}}}}{{x - 1}}} {\text{d}}x = \frac{1}{a} - \pi \cot (\pi a)\quad \left| a \right| < 1$$

$$\begin{aligned}  
\frac{{{x^{ - a}} - {x^a}}}{{1 - x}} &= ({x^{ - a}} - {x^a})\sum\limits_{n = 0}^\infty {{x^n}} \\  
\int_0^1 {\frac{{{x^{ - a}} - {x^a}}}{{1 - x}}} \; {\text{d}}x &= \sum_{n = 0}^\infty {\int_0^1 {({x^{ - a}} - {x^a})} } {x^n}\; {\text{d}}x\\  
&= \sum\limits_{n = 0}^\infty {\left( {\frac{1}{{n + 1 - a}} - \frac{1}{{n + 1 + a}}} \right)} \\  
&= - \sum\limits_{n = 1}^\infty {\left( {\frac{1}{{a - n}} + \frac{1}{{a + n}}} \right)} \\  
&= \frac{1}{a} - \pi \cot (\pi a)  
\end{aligned}$$

嗯,猜想没错...

* * *

再进一步,求证:

$$\int_0^\infty  {\frac{{{e^{ - {x^n}}} - {e^{ - {x^m}}}}}{{x\ln x}}} dx = \ln \frac{m}{n}$$

这已经是参积分了怎么化呢?我觉得你很缺少想象力,不如以函数为参数:

$$\begin{aligned}  
I(f(x)) &= \int_0^\infty {\frac{{f\left( {{x^n}} \right) - f\left( {{x^m}} \right)}}{{x\log \left( x \right)}}} dx\\  
&= \int_{ - \infty }^\infty {\frac{{f\left( {{e^{vn}}} \right) - f\left( {{e^{vm}}} \right)}}{v}} dx\quad \log \left( x \right) \mapsto v\\  
&= \int_0^\infty {\frac{{f\left( {{e^{vn}}} \right) - f\left( {{e^{vm}}} \right)}}{v}} dx - \int_0^\infty {\frac{{f\left( {{e^{ - vn}}} \right) - f\left( {{e^{ - vm}}} \right)}}{v}} dx\\  
&= \left( {f(1) - f(\infty )} \right)\log \frac{m}{n} - \left( {f(1) - f(\infty )} \right)\log \frac{m}{n}\\  
&= \left. { - f(x)} \right|_0^\infty \ln \frac{m}{n}  
\end{aligned}$$

然后把函数代进去...

* * *

计算参积分:

$$f(k) = \int_0^1 {{{\left( {{x^k} + \frac{{\ln x}}{{1 - x}}} \right)}^2}} dx$$

我们不出产这种烂参积分的,我们重新定义一个函数.

$$\begin{aligned}  
{I\_k}(a) &= \int_0^1 {{{\left( {a \cdot {x^k} + \frac{{\ln x}}{{1 - x}}} \right)}^2}} dx\\  
{I\_{k'}}(a) &= 2\int_0^1 {{x^k}} \left( {a \cdot {x^k} + \frac{{\ln x}}{{1 - x}}} \right)dx\\  
&= \frac{{2a}}{{2k + 1}} + 2\int_0^1 {\frac{{{x^k}\ln x}}{{1 - x}}} dx\\  
{I\_k}(a) &= \frac{{{a^2}}}{{2k + 1}} + \left( {2\sum_{j = 1}^k {\frac{1}{{{j^2}}}} - \frac{{{\pi ^2}}}{3}} \right)a + C  
\end{aligned}$$

Well.积分积出常数了,令a=0

$$C = \int_0^1 {{{\left( {\frac{{\ln x}}{{1 - x}}} \right)}^2}dx}  = \frac{{{\pi ^2}}}{3}$$

综上所述:

$$\begin{aligned}  
{I\_k}(a) &= \int_0^1 {{{\left( {a \cdot {x^k} + \frac{{\ln x}}{{1 - x}}} \right)}^2}} dx\\  
&= \frac{{{a^2}}}{{2k + 1}} + \left( {2\sum\limits_{j = 1}^k {\frac{1}{{{j^2}}}} - \frac{{{\pi ^2}}}{3}} \right)a + \frac{{{\pi ^2}}}{3}\\  
&= \frac{{{a^2}}}{{2k + 1}} + a\left( {2H_k^{(2)} - \frac{{{\pi ^2}}}{3}} \right) + \frac{{{\pi ^2}}}{3}\\  
&= \frac{{{a^2}}}{{2k + 1}} - 2a{\psi ^{(1)}}(k + 1) + \frac{{{\pi ^2}}}{3}  
\end{aligned}$$

$\psi $是双Gamma函数,在我这里见过很多次了应该.

* * *

求证:

$$\int_0^{\pi /2} x {\csc ^2}(x)\arctan \left( {\alpha \tan x} \right)\; dx = \frac{\pi }{2}\left[ {\ln \frac{{{{(1 + \alpha )}^{1 + \alpha }}}}{{{\alpha ^\alpha }}}} \right]$$

好吧我不是要你看这个挫到爆的等式,重点$\tan x = u$换元后:

$$\int_0^{\frac{\pi }{2}} x {\csc ^2}(x)\arctan \left( {\alpha \tan x} \right)\; {\text{d}}x = \int_0^\infty  {\frac{{{{\tan }^{ - 1}}u{{\tan }^{ - 1}}\alpha u}}{{{u^2}}}} \; {\text{d}}u$$

接下来证明这个:

$$\bigstar I(\alpha ,\beta ) = \int_0^\infty  {\frac{{{{\tan }^{ - 1}}\alpha u{{\tan }^{ - 1}}\beta u}}{{{u^2}}}} \; {\text{d}}u = \frac{\pi }{2}\log \left( {\frac{{{{(\alpha  + \beta )}^{\alpha  + \beta }}}}{{{\alpha ^\alpha }{\beta ^\beta }}}} \right)$$

老样子看看能不能变重积分,不能,那就求偏导:

$$\begin{aligned}  
{\partial \_\alpha }{\partial \_\beta }I(\alpha ,\beta )  
&= \int_0^\infty {\frac{{{\text{d}}u}}{{(1 + {\alpha ^2}{u^2})(1 + {\beta ^2}{u^2})}}} \\  
&= \frac{1}{{{\alpha ^2} - {\beta ^2}}}\int_0^\infty {\frac{{{\alpha ^2}}}{{1 + {\alpha ^2}{u^2}}}} - \frac{{{\beta ^2}}}{{1 + {\beta ^2}{u^2}}}\; {\text{d}}u\\  
&= \frac{1}{{{\alpha ^2} - {\beta ^2}}}\int_0^\infty {\frac{\alpha }{{1 + {u^2}}}} - \frac{\beta }{{1 + {u^2}}}\; {\text{d}}u\\  
&= \frac{\pi }{{2(\alpha + \beta )}}  
\end{aligned}$$

积α:

$${\partial \_\beta }\int_0^\infty  {\frac{{{{\tan }^{ - 1}}\alpha u{{\tan }^{ - 1}}\beta u}}{{{u^2}}}} \; {\text{d}}u = \frac{\pi }{2}(\log (\alpha  + \beta ) - {C_1}(\beta ))$$

解出这个缺失的函数:

$$\begin{aligned}  
a &\to 0\\  
0 &= \frac{\pi }{2}(\log \beta - C(\beta ))\\  
C(\beta ) &= \log \beta  
\end{aligned}$$

代回去积β:

$$I(\alpha ,\beta ) = \frac{\pi }{2}((\alpha  + \beta )\log (\alpha  + \beta ) - \beta \log \beta  - {C_2}(\alpha ))$$

同样的$\beta  \to 0 \Rightarrow C(\alpha ) = \alpha \log \alpha $

代入化简即证.
