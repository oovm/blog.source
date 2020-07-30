---
title: 积分习题III:取整积分(下)
author: Aster
type: post
date: 2016-07-10T05:12:58+00:00
url: /2016/07/colletion_integrate_1-2/
featured_image: /wp-content/uploads/2016/06/colletion_integrate_3_BG-100x71.jpg
duoshuo_thread_id:
  - "6373465170181620481"
categories:
  - 数学题集
tags:
  - 取整函数
  - 收集
  - 积分习题

---
今天说点进阶难度的题:求证

$$\int_0^1 {\left\lfloor {\frac{\alpha }{x}} \right\rfloor  - \alpha \left\lfloor {\frac{1}{x}} \right\rfloor } {\text{d}}x = \alpha \ln \alpha \quad \alpha  \in (0,1)$$

<!--more-->

* * *

证:

令$u = \alpha /x$

$$\begin{aligned}  
\int_{1/n}^1 \left\lfloor\frac{\alpha}{x}\right\rfloor dx  
&= \alpha \int_{\alpha}^{n \alpha} \frac{\left\lfloor u\right\rfloor}{u^2} \, du \\  
&= \alpha \int_{\alpha}^{n} \frac{\left\lfloor u\right\rfloor}{u^2} \, du - \alpha \int_{n \alpha}^{n} \frac{\left\lfloor u\right\rfloor}{u^2} \, du \\  
&= \alpha \int_{1}^{n} \frac{\left\lfloor u\right\rfloor}{u^2} \, du - \alpha \int_{n \alpha}^{n } \frac{\left\lfloor u\right\rfloor}{u^2} \, du  
\end{aligned}$$

同样的做代换$u = 1/x$

$$\begin{aligned}  
\alpha\int_{1/n}^1 \left\lfloor\frac{1}{x}\right\rfloor dx  
&= \alpha\int_{1}^{n } \frac{\left\lfloor u\right\rfloor}{u^2} \, du \\  
&= \alpha \sum_{k=1}^{n-1}\int_{k}^{k+1 } \frac{\left\lfloor u\right\rfloor}{u^2} \, du \\  
&= \alpha \sum_{k=1}^{n-1}\int_{k}^{k+1 } \frac{k}{u^2} \, du \\  
&= \alpha \sum_{k=1}^{n-1} k\left(\frac{1}{k} - \frac{1}{k+1} \right) \\  
&= \alpha \sum_{k=2}^{n} \frac{1}{k}  
\end{aligned}$$

合起来

$$\begin{aligned}  
I &= \mathop {\lim }\limits\_{n \to \infty } {I\_n}\\  
{I\_n} &= \int_{1/n}^1 {\left( {\left\lfloor {\frac{\alpha }{x}} \right\rfloor - \alpha \left\lfloor {\frac{1}{x}} \right\rfloor } \right)} dx\\  
&= - \alpha \int_{n\alpha }^n {\frac{{\left\lfloor u \right\rfloor }}{{{u^2}}}} {\mkern 1mu} du \\  
&= - \alpha \int_{1}^{n} \frac{\left\lfloor u\right\rfloor}{u^2} \, du + \alpha \int_{1}^{\lfloor n \alpha \rfloor} \frac{\left\lfloor u\right\rfloor}{u^2} \, du + \alpha \int_{\lfloor n \alpha \rfloor}^{n \alpha} \frac{\left\lfloor u\right\rfloor}{u^2} \, du \\  
&= -\alpha \sum_{k=2}^{n} \frac{1}{k} + \alpha \sum_{k=2}^{\lfloor n \alpha \rfloor}\frac{1}{k} + \alpha \frac{n \alpha - \lfloor n \alpha \rfloor}{n \alpha}  
\end{aligned}$$

求极限

$$\begin{aligned}  
I &= \alpha \mathop {\lim }\limits\_{n \to \infty } \left( {\sum_{k = 2}^{ \lfloor n\alpha \rfloor } {\frac{1}{k}} - \sum\limits_{k = 2}^n {\frac{1}{k}} + 1 - \frac{{ \lfloor n\alpha \rfloor }}{{n\alpha }}} \right)\\  
&= \alpha \mathop {\lim }\limits\_{n \to \infty } \left( {\left( {\sum_{k = 1}^{ \lfloor n\alpha \rfloor } {\frac{1}{k}} - \log \lfloor n\alpha \rfloor } \right) - \left( {\sum\limits_{k = 1}^n {\frac{1}{k}} - \log n} \right) + \left( {\log \lfloor n\alpha \rfloor - \log n} \right) + \left( {\frac{{n\alpha - \lfloor n\alpha \rfloor }}{{n\alpha }}} \right)} \right)\\  
&= \alpha \left( {\gamma - \gamma + \mathop {\lim }\limits_{n \to \infty } \left( {\log \frac{{ \lfloor n\alpha \rfloor }}{n}} \right) + 0} \right)\\  
&= \alpha \log \alpha \quad \square  
\end{aligned}$$

* * *

也不是没有简单点的解法,用取整函数的傅里叶展开式:

$$\begin{aligned}  
I &= \int_1^\infty d y\frac{1}{{{y^2}}}\left( {\left\lfloor {ay} \right\rfloor - a\left\lfloor y \right\rfloor } \right)\\  
&\bullet \quad \lfloor x \rfloor = x - \frac{1}{2} + \frac{1}{\pi }\sum\limits_{k = 1}^\infty {\frac{{\sin (2\pi kx)}}{k}} \\  
I &= \frac{1}{\pi }\int_1^\infty d y\frac{1}{{{y^2}}}\left( {\sum_{k \geqslant 1} {\frac{{\sin (2\pi kay) - a\sin (2\pi ky)}}{k}} + \pi \frac{{1 - a}}{2}} \right)\\  
&= - \frac{a}{\pi }\int_{1/a}^1 d q\frac{1}{{{q^2}}}\sum_{k \geqslant 1} {\frac{{\sin (2\pi kq)}}{k}} + \frac{{1 - a}}{2}\\  
&\bullet \quad \Im \sum\limits_{k \geqslant 1} {\frac{{{e^{2i\pi kq}}}}{k}} = \frac{\pi }{2} - \pi q\\  
I &= - a\int_{1/a}^1 d q\left( {\frac{1}{{2{q^2}}} - \frac{1}{q}} \right) + \frac{{1 - a}}{2}\\  
&= a\ln a\quad\square  
\end{aligned}$$

* * *

一道经典题,求证:

$$\int_0^1 {{{\left\lfloor {{x^{ - 1}}} \right\rfloor }^{ - 1}}} dx = \frac{{{\pi ^2}}}{6} - 1$$

证:

$${\left\lfloor {\frac{1}{x}} \right\rfloor ^{ - 1}} = \frac{1}{k}\quad \quad \forall x \in (\frac{1}{{k + 1}},\frac{1}{k}]$$

$$\begin{aligned}  
{I\_n} &= \int_{1/n}^1 {{{\left\lfloor {\frac{1}{x}} \right\rfloor }^{ - 1}}} dx\\  
&= \sum_{k = 1}^{n - 1} {\int_{1/(k + 1)}^{1/k} {{{\left\lfloor {\frac{1}{x}} \right\rfloor }^{ - 1}}} } dx\\  
&= \sum_{k = 1}^{n - 1} {\int_{1/(k + 1)}^{1/k} {\frac{1}{k}} } dx\\  
&= \sum\limits_{k = 1}^{n - 1} {\frac{1}{k}} \cdot \frac{1}{{k(k + 1)}}  
\end{aligned}$$

$$\begin{aligned}  
\int_0^1 {{{\left\lfloor {\frac{1}{x}} \right\rfloor }^{ - 1}}} dx& = \mathop {\lim }\limits\_{n \to \infty } {I_n}\\  
&= \sum\limits_{n = 1}^\infty {\frac{1}{{{n^2}(n + 1)}}} \\  
&= \zeta (2) - 1 \\  
&= \frac{{{\pi ^2}}}{6} - 1  
\end{aligned}$$

* * *

这是这个积分的特例.

$$\int_0^1 {{{ \lfloor {x^{ - 1}} \rfloor }^{ - 1}}} ((s + 1){x^s} - s{x^{s - 1}})dx = \zeta (s + 2) - 1\quad s > 0$$

证,设$t = {x^{ - 1}},dx =  - {t^{ - 2}}dt$

$$\begin{aligned}  
\int_{1}^\infty \lfloor t\rfloor^{-1} t^{-(s+2)}dt  
&= \sum_{k=1}^\infty \frac{1}k\int_{k}^{k+1}t^{-(s+2)}dt \\&= \frac{1}{s+1}\sum_{k=1}^\infty \frac{1}{k}\left(k^{-(s+1)}-(k+1)^{-(s+1)}\right)\\  
&= \frac{1}{s+1}\left(\sum_{k=1}^\infty \frac{1}{k^{s+2}}-\sum_{k=1}^\infty \frac{1}{k(k+1)^{s+1}}\right)\\  
\int_0^1 \lfloor x^{-1} \rfloor^{-1} (s+1)\:x^s \:\mathrm dx &= \zeta(s+2)-\sum_{k=1}^\infty \frac{1}{k(k+1)^{s+1}} \quad s >1\\  
\int_0^1 \lfloor x^{-1} \rfloor^{-1} s\:x^{s-1} \:\mathrm dx &= \zeta(s+1)-\sum_{k=1}^\infty \frac{1}{k(k+1)^{s}} \quad\quad s >2\\  
\sum_{k=1}^\infty \frac{1}{k(k+1)^{s}}-\sum_{k=1}^\infty \frac{1}{k(k+1)^{s+1}}&=\sum_{k=1}^\infty \frac{1}{k(k+1)^{s}}\left(1-\frac{1}{(k+1)}\right)=\zeta(s+1)-1\\  
\int_0^1 \lfloor x^{-1} \rfloor^{-1} ((s+1)x^s-sx^{s-1}) dx &= \zeta(s+2)-1 \quad s >0 \quad\square  
\end{aligned}$$
