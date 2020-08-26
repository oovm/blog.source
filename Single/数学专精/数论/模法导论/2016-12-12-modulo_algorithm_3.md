---
title: 模法导论(番外)
author: Aster
type: post
date: 2016-12-12T04:12:21+00:00
url: /2016/12/modulo_algorithm_3/
featured_image: /wp-content/uploads/2016/12/BinomialPascal-100x52.png
duoshuo_thread_id:
  - "6375339192842453762"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - 模运算
  - 科普
  - 高端黑

---
说说两个有趣的关于求模的算法.

第一个是阶乘求模.这个么,其实规模小的时候$\left( {a!\bmod n\quad a < n < {{10}^6}} \right)$也没什么优化可用.硬刚吧.

<pre class="lang:mathematica decode:true" title="算法比较测试">n=10^6;p=Prime[10^8];
Mod[Factorial[n],p]//RepeatedTiming
Mod[Times@@Range[n],p]//RepeatedTiming
Fold[Mod[#1 #2,p]&,Range[n]]//RepeatedTiming
FixedPoint[Mod[Times@@@Partition[#,UpTo[2]],p]&,Range[n]]//RepeatedTiming
FixedPoint[Mod[Times@@@Partition[#,UpTo[100]],p]&,Range[n]]//RepeatedTiming
RepeatedTiming[j=1;Do[j=Mod[i j,p],{i,n}];j]
Last@Nest[Mod[{First@#1+1,First@#1*Last@#1},p]&,{1,1},n]//RepeatedTiming</pre>

  1. 先朴素的把这个数算出来然后求模<span style="color: #ff6600;">0.23s</span>,good.
  2. 自己造个轮子把数算出来然后求模,<span style="color: #ff6600;">0.70s</span>,233,说了不要自己造轮子.
  3. 用Fold折叠列表,边乘边模,<span style="color: #ff6600;">0.12s</span>,Excellent! 如果是Haskell的话应该会更快吧,第一有惰性计算,第二乘法计算速度真的丧心病狂,当初刷OJ直接写a*b过了大数乘法,而且还是第一.......
  4. 所以我们想能不能从两边一起折叠这个列表,Sorry,MMA没有这种的,然后想到要是对折这个列表岂不是可以有${\log _2}n$的算法了?想得美,<span style="color: #ff6600;">0.82s</span>.
  5. 好吧对折太慢了,应该一次折叠100重,<span style="color: #ff6600;">0.23s</span>.Well,看来多出来的那么多次乘法和取模不管怎样反而消耗了更多的资源呐.
  6. 所以我们来用循环吧!<span style="color: #ff6600;">1.02s</span>,666,说了MMA里能不用循环就不要用循环,特别是不编译直接正面刚,而且用了编译还不如全部用C#写然后Link进来.我用C#写了个naïve的循环确实是<span style="color: #ff6600;">0.1s</span>左右.
  7. 想到个折中的办法,Nest尾递归一个二元组就不用维护列表了.<span style="color: #ff6600;">0.16s</span>,唔,不是很懂怎么搞的,会比Fold慢好玄学啊.

<!--more-->

---

为什么不用和快速幂模类似的算法呢?实在是a小的时候没啥用还不如Fold硬刚,a大的时候又有更好的选择了.

$a!\bmod n\quad a >  > n > {10^6}$时

威尔逊定理说:

$$(p - 1)!\; \equiv \; - 1\bmod p$$

证:如果$p$是个质数,那么$1,2,3,...,p - 2,p - 1$都和$p$互质

$$\begin{aligned}  
(p - 2)! &\equiv {((p - 2)!)^{p - 1}} \equiv 1\bmod p \\  
\Rightarrow (p - 1)! &\equiv (p - 1) \cdot 1 \equiv - 1\bmod p\quad\square  
\end{aligned}$$

正着用这个定理一点用都没有,本来判定大质数就够烦了,居然还要来求阶乘,你是在搞笑吗?!朴素(naïve)的试除法的复杂度才$O(\sqrt n )$.

嘛,其实这个暗示了反过来也是有大约这个速度的算法的.我们想个办法把阶乘分解成数阵,令$m = \sqrt {a - 1} \;$

$$P(x) = (x + 1)(x + 2) \cdots (x + m)$$

$$\begin{array}{*{20}{l}}  
{P(0)}&{0 + 1}&{0 + 2}& \cdots &{0 + m}&{(1m)} \\  
{P(m)}&{m + 1}&{m + 1}& \cdots &{m + m}&{(2m)} \\  
{P(2m)}&{2m + 1}&{2m + 2}& \cdots &{2m + m}&{(3m)} \\  
\cdots\cdots&\cdots\cdots&\cdots\cdots&\cdots&\cdots\cdots\cdots&\cdots\cdots&\\  
{P(m(m - 1))}&{m(m - 1) + 1}&{m(m - 1) + 2}& \cdots &{m(m - 1) + m}&{({m^2})}  
\end{array}$$

 

左右乘起来

$$\begin{aligned}  
a! &= aP(0)P(m) \cdots P(m(m - 1))\\  
a!\,\bmod \,n &= \left( {a\,\bmod \,n\prod\limits_{i = 0 + m}^{m(m - 1)} {P(mi)\,\bmod \,n} } \right)\,\bmod \,n  
\end{aligned}$$

如果开根不是整数那么就下取整然后把缺掉的部分补上就行了.

用类FFT算法,计算量瞬间砍掉一半.理论上把复杂度从$O\left( n \right)$降到了$O\left( {{n^{0.5 + \varepsilon }}} \right)$,而且其实还能优化,模质数的时候也能掉用点数论.但是在n小的时候表现并不好,所以可以用一个复合策略来再度优化,我反正懒得干了,就补一个朴素的例子吧,<span style="color: #ff6600;">0.045s</span>.

<pre class="lang:mathematica decode:true">n=10^6;p=Prime[10^8];
list[n_]:=If[IntegerQ@Sqrt[n-1],
m=Sqrt[n-1];Table[Pochhammer[1+i,m],{i,0,m(m-1),m}]~Join~{n},
m=Floor[Sqrt[n]];Table[Pochhammer[1+i,m],{i,0,m(m-1),m}]~Join~Range[1+Floor[Sqrt[n]]^2,n]];
Fold[Mod[#1 #2,p]&,Range[n]]//RepeatedTiming
Fold[Mod[#1 #2,p]&,list[n]]//RepeatedTiming</pre>

算了,写的还是不好,[比这个C写的慢了10多倍][1].

---

第二个就是求组合数的模了.

模质数的时候有卢卡斯定理:

$$\begin{aligned}  
m &= {m\_k}{p^k} + {m\_{k - 1}}{p^{k - 1}} + \cdots + {m\_1}p + {m\_0}\\  
n &= {n\_k}{p^k} + {n\_{k - 1}}{p^{k - 1}} + \cdots + {n\_1}p + {n\_0}\\  
\left( \begin{gathered}  
m \\n \\  
\end{gathered} \right) &\equiv \prod\limits_{i = 0}^k {\left( \begin{gathered}  
{m\_i} \\{n\_i} \\  
\end{gathered} \right)} \bmod p  
\end{aligned}$$

证:

$$\begin{aligned}  
\left( \begin{gathered}  
p \\n \\  
\end{gathered} \right) &= \frac{{p \cdot (p - 1) \cdots (p - n + 1)}}{{n \cdot (n - 1) \cdots 1}}\\  
{(1 + X)^p} &\equiv 1 + {X^p}\bmod p\\  
{(1 + X)^{{p^i}}} &\equiv 1 + {X^{{p^i}}}\bmod p  
\end{aligned}$$

令

$$m = \sum_{i = 0}^k {{m\_i}} {p^i}$$

$$\begin{aligned}  
\sum\limits_{n = 0}^m {C(m,n){X^n}} &= {(1 + X)^m} \hfill \\  
&= \prod_{i = 0}^k {{{\left( {{{(1 + X)}^{{p^i}}}} \right)}^{{m\_i}}}}\\  
&= \prod_{i = 0}^k {\sum_{{n\_i} = 0}^{{m\_i}} {C({m\_i},{n\_i}){X^{{n_i}{p^i}}}} }\\  
&= \prod_{i = 0}^k {\sum_{{n\_i} = 0}^{p - 1} {C({m\_i},{n\_i}){X^{{n\_i}{p^i}}}} }\\  
&= \sum_{n = 0}^m {\prod_{i = 0}^k {C({m\_i},{n\_i}){X^n}} } \;\,\bmod \,\;p\\  
C(m,n) &\equiv \prod_{i = 0}^k {C({m\_i},{n_i})} \;\,\bmod \,\;p\quad \square  
\end{aligned}$$

不过这个只能模质数,OJ的时候倒是少有不是模质数的.有点求知欲好不好,难道做题用不到就不推了吗?

卢卡斯定理揭示了杨辉三角和谢宾斯基三角之间的联系.

  


从这个演示上可以看出其实非模p的情况是各种模p的情况的叠加.

我们来一步步推导,先讨论纯素数叠加的形式,即假设n无平方因子,也就是说$n = {p\_0} \cdot {p\_1} \ldots  \cdot {p\_r}$,分别求解$C[n,k]\bmod \,{p\_i}$,得到解${a\_0},{a\_1}, \ldots ,{a_r}$.嗯,然后怎么把解合起来呢?

啊哈,中国剩余定理.

$$\left\{ \begin{gathered}  
x \equiv {a\_0}\bmod {p\_0} \hfill \\  
x \equiv {a\_1}\bmod {p\_1} \hfill \\  
\cdots \cdots \cdots \cdots \cdots \hfill \\  
x \equiv {a\_r}\bmod {p\_r} \hfill \\  
\end{gathered} \right.$$

中国剩余定义的适用条件是所有的模都要是质数,当然满足啦.

但是这样又钦点了n无平方因子,得用更强的手段去掉这个条件.

 [Andrew Granville定理][2]给出了模${p^k}$时的结论.

$$\frac{1}{{{p^{{e_0}}}}}\left( \begin{gathered}  
n \\m \\  
\end{gathered} \right) \equiv {( \pm 1)^{{e\_q} - 1}}\left( {\frac{{{{({N\_0}!)}\_p}}}{{{{({M\_0}!)}\_p}{{({R\_0}!)}\_p}}}} \right)\left( {\frac{{{{({N\_1}!)}\_p}}}{{{{({M\_1}!)}\_p}{{({R\_1}!)}\_p}}}} \right)...\left( {\frac{{{{({N\_d}!)}\_p}}}{{{{({M\_d}!)}\_p}{{({R\_d}!)}_p}}}} \right)\quad \bmod \,{p^q}$$

这个定理看上去复杂实现起来也很复杂,我就不在这里写了.已同步到BiGridGenerator程序包.

这里只给出前两种情况

<pre class="lang:haskell decode:true">LucasTheorem[a_,b_,p_?PrimeQ]:=Block[
{pn=IntegerDigits[#,p]&/@{a,b},sn},
sn=PadLeft[#,Max[Length/@pn]]&/@pn;
sn=PadLeft[#,Max[Length/@pn]]&/@pn;
Mod[Times@@Mod[Binomial@@@Transpose@sn,p],p]];
SquareFreeMod[a_,b_,p_?SquareFreeQ]:=Block[
{pp=FactorInteger[p][[All,1]],xx},
xx=LucasTheorem[a,b,#]&/@pp;
ChineseRemainder[xx,pp]];
(*(*卢卡斯定理正确性检验*)
a=Table[Mod[Binomial[i,j],13],{i,1,100},{j,1,100}];
b=Table[LucasTheorem[i,j,13],{i,1,100},{j,1,100}];
a$$Equal]b*)
(*(*无平方因子正确性验证*)
a=Table[SquareFreeMod[i,50,230],{i,50,200}];
b=Table[Mod[Binomial[i,50],230],{i,50,200}];
a$$Equal]b*)</pre>

---

推荐阅读:  
http://math.stackexchange.com/questions/60206/lucas-theorem-but-without-prime-numbers  
http://fishi.devtail.io/weblog/2015/06/25/computing-large-binomial-coefficients-modulo-prime-non-prime/  
http://fredrikj.net/blog/2012/03/factorials-mod-n-and-wilsons-theorem/

 [1]: http://fredrikj.net/blog/2012/03/factorials-mod-n-and-wilsons-theorem/
 [2]: http://www.dms.umontreal.ca/~andrew/PDF/BinCoeff.pdf