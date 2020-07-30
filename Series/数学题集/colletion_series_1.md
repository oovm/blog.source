---
title: 级数习题 I
author: Aster
type: post
date: 2016-03-17T06:04:01+00:00
url: /2016/03/colletion_series_1/
featured_image: /wp-content/uploads/2016/03/colletion_series_1_BG-100x53.png
duoshuo_thread_id:
  - "6373465154671084290"
categories:
  - 数学题集
tags:
  - 收集
  - 级数习题

---
$$\begin{aligned}  
\frac{1}{{1 \times 2}} + \frac{1}{{2 \times 3}} + \frac{1}{{3 \times 4}} + \frac{1}{{4 \times 5}} + \ldots & = \sum\limits_{i = 0}^\infty {\frac{1}{{(i + 1)(i + 2)}}} = \frac{1}{2} \hfill \\  
\frac{1}{{1 \times 2 \times 3}} + \frac{1}{{2 \times 3 \times 4}} + \frac{1}{{3 \times 4 \times 5}} + \ldots & = \sum\limits_{i = 0}^\infty {\frac{1}{{(i + 1)(i + 2)(i + 3)}}} = \frac{1}{4} \hfill \\  
\frac{1}{{1 \times 2 \times \ldots \times k}} + \frac{1}{{2 \times 3 \times \ldots \times (k + 1)}} + \ldots & = \sum\limits_{i = 0}^\infty {\frac{1}{{(i + 1)(i + 2) \ldots (i + k)}}} {\text{ = ?}} \hfill \\  
\end{aligned}$$

<!--more-->

$$\begin{aligned}  
\sum_{i=0}^{\infty} \frac{1}{(i+1)(i+2)}  
&= \lim\_{N \rightarrow \infty} \sum\_{i=0}^N \frac{1}{(i+1)(i+2)}\\  
&= \lim\_{N \rightarrow \infty} \sum\_{i=0}^N \left( \frac{1}{i+1} - \frac{1}{i+2}\right )\\  
&= \lim\_{N \rightarrow \infty} \sum\_{i=0}^N \frac{1}{i+1} - \sum_{i=1}^{N+1} \frac{1}{i+1}\\  
&= \lim_{N \rightarrow \infty} \frac{1}{2} - \frac{1}{N+2} \\  
&= \frac{1}{2}  
\end{aligned}$$

$$\begin{aligned}  
\frac{1}{(i+1)(i+2)(i+3)}  
& = \frac{1}{2}\left( \frac{1}{(i+1)(i+2)} - \frac{1}{(i+2)(i+3)} \right)\\  
\frac{1}{(i+1)(i+2) \ldots (i + k)} &= \frac{1}{(i+2)\ldots (i+k-1)} \left( \frac{1}{(i+1)(i+k)} \right)\\  
&= \frac{1}{(i+2)\ldots (i+k-1)} \cdot \frac{1}{(k-1)}\left( \frac{1}{(i+1)} - \frac{1}{(i+k)} \right)\\  
&= \frac{1}{k-1} \left( \frac{1}{(i+1)(i+2)\ldots (i+k-1)} - \frac{1}{(i+2)(i+3)\ldots (i+k)} \right)  
\end{aligned}$$

$$\begin{aligned}  
\sum\limits\_{i = 0}^\infty {\prod\limits\_{j = 1}^k {\frac{1}{{(i + j)}}} } {\text{ }} & = \mathop {\lim }\limits\_{N \to \infty } \sum\limits\_{i = 0}^N {\frac{1}{{(i + 1)(i + 2) \ldots (i + k)}}}\\  
&= \lim\_{N \rightarrow \infty} \frac{1}{k-1} \sum\_{i=0}^N \left( \frac{1}{(i+1)(i+2)\ldots (i+k-1)} - \frac{1}{(i+2)(i+3)\ldots (i+k)} \right) \\  
&= \lim\_{N \rightarrow \infty} \frac{1}{k-1} \left( \sum\_{i=0}^N \frac{1}{(i+1)(i+2) \ldots (i+k-1)} - \sum_{i=1}^{N+1} \frac{1}{(i+1)(i+2) \ldots (i + k - 1)} \right) \\  
&= \lim_{N \rightarrow \infty} \frac{1}{k-1} \left( \frac{1}{1 \times 2 \times \ldots \times (k-1) } - \frac{1}{(N+2)(N+3) \ldots (N+k) } \right) \\  
&= \frac{1}{{(k - 1) \times (k - 1)!}} = \frac{1}{{(k - 1)\Gamma (k)}}  
\end{aligned}$$

嘛,有趣的事情在于

$$\sum _{i=0}^{\infty } \frac{i!}{(i+k)!} = \frac{1}{{(k - 1)\Gamma (k)}}$$

不过反过来就没了

$$\sum_{i=0}^{\infty} \binom{i+k}{k} ^{-1} = \frac{k}{k-1}$$

其实还可以继续推广的说

$\begin{aligned}  
S &=\sum\_{k=2}^{\infty}\sum\_ {n=1}^{\infty} \frac{1}{n(n+1)(n+2)...(n+k-1)}\\  
&=\sum\_{k\geq 2}\sum\_{n\geq 1}\frac{1}{(n)\_k} = \sum\_{m\geq 1}\frac{1}{m\cdot m!}\\  
&=\int\_{0}^{1}\sum\_{m\geq 1}\frac{x^{m-1}}{m!}\,dx = {\int_{0}^{1}\frac{e^x-1}{x}\,dx}\\  
&=Ei(1)-\gamma \quad \square  
\end{aligned}$

* * *

$\begin{aligned}  
\sum\_{k=1}^{\infty} \frac{1}{k^3(k+1)^3} &= \lim\_{N \rightarrow \infty} \sum_{k=1}^{N} \frac{1}{k^3(k+1)^3}\\  
&= \lim\_{N \rightarrow \infty} \sum\_{k=1}^{N} \frac{ (k+1)^3(6k^2 - 3k+ 1) - k^3(6k^2 + 15k+10)}{k^3(k+1)^3}\\  
&= \lim\_{N \rightarrow \infty} \left(\sum\_{k=1}^{N} \frac{ 6k^2 - 3k+ 1}{k^3} - \frac{6k^2 + 15k+10}{(k+1)^3}\right)\\  
&= \lim\_{N \rightarrow \infty} \sum\_{k=1}^{N} \left(\frac{ 6k^2 - 3k+ 1}{k^3} - \frac{6(k+1)^2 + 3(k+1) + 1}{(k+1)^3}\right)\\  
&= \lim\_{N \rightarrow \infty} \sum\_{k=1}^{N} \left(\frac{6}{k} - \frac{3}{k^2} + \frac{1}{k^3}\right) - \sum_{k=2}^{N+1} \left(\frac{6}{k} + \frac{3}{k^2} + \frac{1}{k^3}\right)\\  
&= \left(\frac{6}{1} - \frac{3}{1} + \frac{1}{1}\right) - \lim\_{N \rightarrow \infty} \sum\_{k=2}^{N} \frac{6}{k^2} - \lim_{N \rightarrow \infty}\left(\frac{6}{N+1} + \frac{3}{(N+1)^2} + \frac{1}{(N+1)^3} \right)\\  
&= 4 - (\pi^2 - 6) - 0 \quad\\  
&= 10-\pi^2  
\end{aligned}$

吐槽下,这个又是拉马努金发现的.

* * *

$\begin{aligned}  
\sum_{n=0}^{\infty} {n \over 2^n} & = ?\\  
\because {f(x) \over x} &= \sum_{n=0}^{\infty} nx^{n-1} \\  
&= {d \over dx} \sum_{n=0}^{\infty} x^n \\  
&= {d \over dx} {1 \over {1-x}} = {1 \over (x-1)^2}\\  
\therefore f(x) & = {x \over (x-1)^2}\\  
\therefore f({1 \over 2}) & = 2  
\end{aligned}$

这么做比错位相减法简单多了.

* * *

用相似的方法计算

$\begin{aligned}  
\sum_{n=0}^\infty (n+1)x^n & = ?\\  
g(x) & = \sum_{n=0}^\infty{n+k-1\choose n}x^n={1\over (1-x)^k}\\  
\sum\_{n=0}^\infty{(n+1)x^n}& = \sum\_{n=0}^\infty{n+1\choose n}x^n={1\over (1-x)^2}  
\end{aligned}$
