---
title: 模法导论(上)
author: Aster
type: post
date: 2016-11-11T03:11:35+00:00
url: /2016/11/modulo_algorithm_1/
featured_image: /wp-content/uploads/2016/11/png-100x66.png
duoshuo_thread_id:
  - "6375338709075624705"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - 模运算
  - 科普

---
今年双十一我们来研究些模法.

所谓模法就是对一个数求模.

$$\begin{aligned}  
a &= nq + r\quad q \in \mathbb{Z},\left| r \right| < \left| n \right| \\  
r &= a\bmod q\;or\;\bmod (a,q)  
\end{aligned}$$

在两数都是正数的情况下就是一个数除以另一个数的余数.也就是说正数的时候等价于求余,负数的时候就和求余相反了.

用初等函数写出来就是:

$$r = a - n\left\lfloor {\frac{a}{n}} \right\rfloor  = \frac{n}{2} - \frac{n}{\pi }\sum\limits_{k = 1}^\infty  {\frac{{\sin (2\pi k\frac{a}{n})}}{k}} $$

本模导书收录了以下模法:

  * 模法理论:归零原理,恒等原理,交换原理,分配原理
  * 初阶模法:加法求模,乘法求模,除法求模
  * 中阶模法:快速幂求模,矩阵幂求模,幂同余,欧拉幂模
  * 高阶模法:幂塔求模以及迭代幂次模
  * 无等阶模法:阶乘模和二项模

<!--more-->

---

# 初阶模法

  * 归零公理,交换公理,分配公理

$$na\bmod n = 0$$

我只是单纯不想证明这个玩意儿,我实在想不出能整除模就是0这种东西有什么好证明的,所以就说它是公理好了.并且下面所有的推导都要用到这个公理,还有什么交换律分配率我也懒得证明了,所以就一起钦定为公理吧.

  * 恒等求模原理

恒等求模原理说的是

$$a\bmod n\bmod n\bmod n \ldots  \ldots  = a\bmod n$$

虽然这个说的和废话一样不过我们还是要证明一下:

因为左边的递归特性,所以我们只要证明$a\bmod n\bmod n = a\bmod n$就行了.

证:

$$\begin{aligned}  
a &= nh + (a\,\bmod \,n)\\  
a\bmod n &= \left( {nh + (a\,\bmod \,n)} \right)\bmod n\\  
&= n( \cdots )\bmod n + a\bmod n\bmod n\\  
&= a\bmod n\bmod n\quad\square  
\end{aligned}$$

  * 加法求模原理

加法求模原理说的是

$$\left( {\sum_{i = 1}^n {{a\_i}} } \right)\bmod n = \left( {\sum_{i = 1}^n {{a\_i}\bmod n} } \right)\bmod n$$

同样因为递归特性只要证明$\left( {a + b} \right)\bmod n = \left( {a\bmod n + b\bmod n} \right)\bmod n$就行了

$$\begin{aligned}  
a &= nh + (a{\mkern 1mu} \,\bmod \,{\mkern 1mu} n)\\  
b &= nk + (b{\mkern 1mu} \,\bmod \,{\mkern 1mu} n)\\  
(a + b){\mkern 1mu} \,\bmod \,{\mkern 1mu} n  
&= \left( {a{\mkern 1mu} \,\bmod \,{\mkern 1mu} n + b{\mkern 1mu} \,\bmod \,{\mkern 1mu} n + n(k + h)} \right)\,\bmod \,{\mkern 1mu} n\\  
&= \left( {a{\mkern 1mu} \,\bmod \,{\mkern 1mu} n + b{\mkern 1mu} \,\bmod \,{\mkern 1mu} n} \right)\,\bmod \,{\mkern 1mu} n + n( \cdots )\bmod n\\  
&= (a{\mkern 1mu} \,\bmod \,{\mkern 1mu} n + b{\mkern 1mu} \,\bmod \,{\mkern 1mu} n){\mkern 1mu} \,\bmod \,{\mkern 1mu} n\quad\square  
\end{aligned}$$

  * 乘法求模原理

乘法求模原理说的是:

$$\left( {\prod_{i = 1}^n {{a\_i}} } \right)\bmod n = \left( {\prod_{i = 1}^n {{a\_i}\bmod n} } \right)\bmod n$$

同样的只要证:$ab\bmod n = \left( {\left( {a\bmod n} \right)\left( {b\bmod n} \right)} \right)\bmod n$

$$\begin{aligned}  
a &= nh + (a\,\bmod \,n)\\  
b &= nk + (b\,\bmod \,n)\\  
(ab)\,\bmod \,n  
&= \left( {(a\,\bmod \,n)(b\,\bmod \,n) + n\left( {k(a\,\bmod \,n) + h(b\,\bmod \,n) + hkn} \right)} \right)\bmod n\\  
&= (\left( {a\,\bmod \,n} \right)\left( {b\,\bmod \,n)} \right)\,\bmod \,n + n\left( \cdots \right)\bmod n\\  
&= (\left( {a\,\bmod \,n} \right)\left( {b\,\bmod \,n)} \right)\,\bmod \,n\quad\square  
\end{aligned}$$

  * 除法求模原理

显然

$$(a/b){\mkern 1mu} \,\bmod \,{\mkern 1mu} n = (a{\mkern 1mu} \,\bmod \,{\mkern 1mu} n + {b^{ - 1}}{\mkern 1mu} \,\bmod \,{\mkern 1mu} n){\mkern 1mu} \,\bmod \,{\mkern 1mu} n$$

不过我要说的不是这个,因为要用到高等模导学里的模逆元和欧拉函数.这种一般是a能整除b,但是a比nb还要大很多很多,算这么一个乘法很累.此时就可以用这个:

$$\frac{a}{b}\bmod n = \frac{1}{b}(a + nbk) = \frac{1}{b}(a + \bmod nb)$$

---

# 中阶模法

  * 快速幂求模

${a^b}\bmod n$怎么求呢?当b很大时算这个数是很浪费的,所以如何在避免计算这个数的情况下求模呢?

哦,我们想到可以用使用乘法求模原理分解为两个相等的部分,这样两个部分就只要计算一次了.

$$\begin{aligned}  
{a^b}\bmod n &= \left( {a \times {a^{2(b - 1)/2}}} \right)\bmod n\\  
&= \left( {a\bmod n} \right){\left( {{a^{(b - 1)/2}}{\mkern 1mu} \,\bmod \,{\mkern 1mu} n} \right)^2}\bmod \,{\mkern 1mu} n&b &\in Odd\\  
{a^b}\bmod n &= \left( {{a^{2b/2}}} \right)\bmod n\\  
&= {\left( {{a^{b/2}}{\mkern 1mu} \,\bmod \,{\mkern 1mu} n} \right)^2}\bmod \,{\mkern 1mu} n &b&\in Even  
\end{aligned}$$

于是这个过程可以递归下去,于是每次的计算规模都会减小,最多${\log _2}b$就能把指数幂削到1了.如果使用的语言有类似自动缓存这样的特性的话还能更快.

  * 快速矩阵幂求模

其实是一样的,就是把数字a换成矩阵A而已,数字其实可以看成1维的矩阵.补一个用Haskell实现的算法.

<pre class="lang:haskell decode:true" title="快速矩阵幂">modulo = 100000--输入取模
transMatrix = [[1,1],[1,0]]--输入转移矩阵
firstValue =[[0],[1]]--输入初始值
--得到数列第n项mod m的结果
answer n = head ( head ( multMatrix (fastMatrix transMatrix n modulo) firstValue))

--定义二阶矩阵运算
multMatrix :: Num t => [[t]] -> [[t]] -> [[t]]
multMatrix [[a,b],[c,d]] [[e],[f]] = [[a*e+b*f],[c*e+d*f]]
multMatrix [[a,b],[c,d]] [[e,f],[g,h]] = [[a*e+b*g,a*f+b*h],[c*e+d*g,c*f+d*h]]
modMatrix [[a,b],[c,d]] m = [[mod a m,mod b m],[mod c m,mod d m]]
--快速矩阵幂取模
fastMatrix [[a,b],[c,d]] 0 m = [[1,0],[0,1]]
fastMatrix [[a,b],[c,d]] 1 m = modMatrix [[a,b],[c,d]] m
fastMatrix [[a,b],[c,d]] p m
  | odd p      = modMatrix (multMatrix [[a,b],[c,d]] bak) m
  | otherwise  = bak
  where 
    foo = p `div` 2
    bar = modMatrix [[a^2+b*c,a*b+b*d],[a*c+c*d,b*c+d^2]] m
    bak = fastMatrix bar foo m</pre>

  * 幂同余定理

其实就是快速幂的位运算版本

比如计算${2^{91}}\bmod 91$,千万不要手抽用费马小定理,91不是质数.我们来把91写成二进制.

$${91\_{10}} = {1011011\_2}$$

我们从左到右读这个数.

$$\begin{array}{*{20}{c}}  
{{1\_2}}&{{{10}\_2}}&{{{101}\_2}}&{{{1011}\_2}}&{{{10110}\_2}}&{{{101101}\_2}}&{{{1011011}_2}} \\  
{{1\_{10}}}&{{2\_{10}}}&{{5\_{10}}}&{{{11}\_{10}}}&{{{22}\_{10}}}&{{{45}\_{10}}}&{{{91}_{10}}}  
\end{array}$$

简单地说奇偶可以通过尾数快速判定,然后每次迭代都只要压一位就行了.所以可以提速快速幂.

  * 欧拉幂模

欧拉$\varphi $函数给出的是少于或等于n的数中与n互质的数的数目,可以定义为:

$$\varphi (n) = n\prod\limits_{p\mid n} {\left( {1 - \frac{1}{p}} \right)} $$

还是用Haskell撸一个

<pre class="lang:haskell decode:true" title="欧拉总计函数">import Data.List
themax n= ceiling$sqrt$fromIntegral n
primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..]
  where
      sieve (p:ps) xs = n ++ sieve ps [x | x <- ns, x `rem` p /= 0]
          where (n,~(_:ns)) = span (< p*p) xs
--整数因式分解
factors :: Integral a => a -> [a]
factors n = if even n then 2 : factors (div n 2) else fact n 3
fact 1 _ = []
fact n k = if null xs then [n] else let p = head xs in p : fact (div n p) p
  where xs = [x|x <- [k,k+2..themax n], mod n x == 0 ]
--整数因式分解统计
primeFactorsMult :: Integer -> [(Integer, Int)]
primeFactorsMult = map f.group.factors
  where f xs = (head xs, length xs)
--欧拉总计函数
eulerTotient :: Integer -> Integer
eulerTotient 1 = 1
eulerTotient m = product [(p-1)*p^(c-1)|(p,c)<-primeFactorsMult m]</pre>

<a>欧拉函数</a>有这么一个性质:

$${a^m}\bmod n \equiv {a^{m\;\bmod \varphi (n)}}$$

证:

引理:若a,n互质,则

$${a^{\varphi (n)}} \equiv 1\bmod n$$

令$m = d + k\varphi (n)$

$$\begin{aligned}  
{a^m} &= {a^d}{({a^{\varphi (n)}})^k} \equiv {a^d}\bmod n\\  
\because {a^{\varphi (n)}} &\equiv 1\bmod n\\  
m &\equiv d\bmod \varphi (n)\\  
\therefore\quad {a^m}& \bmod n \equiv {a^{m\;\bmod \varphi (n)}}\quad \square  
\end{aligned}$$

---

题图为反常栅格化,运行出来的矢量图和这张栅格化之后的位图一点也不一样,完美解释反常栅格化,代码如下...

<pre class="lang:mathematica decode:true" title="反常栅格化">data=ArrayPlot@Table[Mod[x^2+y^2,100],{x,-50,50,#},{y,-50,50,#}]&/@{25,5,2,1,0.5,0.05}
Export["png.png",GraphicsGrid[Partition[data,3],ImageSize->Large],Background->None];</pre>