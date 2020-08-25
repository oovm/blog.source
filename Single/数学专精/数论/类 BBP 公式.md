---
title: 【π史话】BBP类公式
author: Aster
type: post
date: 2017-03-10T09:45:27+00:00
url: /2017/03/bbp_type_formula/
duoshuo_thread_id:
  - "6395803861595980545"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - BBP公式
  - 圆周率

---
<img class="aligncenter wp-image-732 size-full" src="../wp-content/uploads/2017/03/Pi_Cycle.png" alt="" width="500" height="501" />

BBP公式全称为 **贝利-波尔温-普劳夫公式** (<a href="https://en.wikipedia.org/wiki/Bailey%E2%80%93Borwein%E2%80%93Plouffe_formula" target="_blank" rel="noopener">Bailey–Borwein–Plouffe formula</a>),该公式发现于1995年,以三位发表者的名字命名.

最初的一个BBP公式是:

$$\pi  = \sum\limits_{k = 0}^\infty  {\frac{1}{{{{16}^k}}}\left( {\frac{4}{{8k + 1}} - \frac{2}{{8k + 4}} - \frac{1}{{8k + 5}} - \frac{1}{{8k + 6}}} \right)} $$ 

证明不算太难,可以作为一道高数习题.一个思路是交换积分求和次序来将式子转化为有理分式积分.

$$\begin{aligned}  
\int_0^{1/\sqrt 2 } {\frac{{{x^{p - 1}}}}{{1 - {x^8}}}{ \mathrm{d}}x} &= \int_0^{1/\sqrt 2 } {\sum\limits_{k = 0}^\infty {{x^{p - 1 + 8k}}} { \mathrm{d}}x} \\  
&= \sum_{k = 0}^\infty {\int_0^{1/\sqrt 2 } {{x^{p - 1 + 8k}}{ \mathrm{d}}x} } \\  
&= \sum\limits_{k = 0}^\infty {\frac{{{2^{ - 4k - \frac{p}{2}}}}}{{8k + p}}} \\  
&= \frac{1}{{{2^{p/2}}}}\sum\limits_{k = 0}^\infty {\frac{1}{{{{16}^k}}}\frac{1}{{8k + p}}} \\  
\end{aligned} $$ 

<!--more--> [shortcode_spoiler title="计算过程" style="fancy" icon="plus-circle"] 

$$\begin{aligned}  
&\sum\limits_{k = 0}^\infty {\frac{1}{{{{16}^k}}}\left( {\frac{4}{{8k + 1}} - \frac{2}{{8k + 4}} - \frac{1}{{8k + 5}} - \frac{1}{{8k + 6}}} \right)} \\  
=& 4 \cdot {2^{1/2}}\int_0^{1/\sqrt 2 } {\frac{{{x^{1 - 1}}{ \mathrm{d}}x}}{{1 - {x^8}}}} - 2 \cdot {2^{4/2}}\int_0^{1/\sqrt 2 } {\frac{{{x^{4 - 1}}{ \mathrm{d}}x}}{{1 - {x^8}}}} - 2 \cdot {2^{5/2}}\int_0^{1/\sqrt 2 } {\frac{{{x^{5 - 1}}{ \mathrm{d}}x}}{{1 - {x^8}}}} - {2^{6/2}}\int_0^{1/\sqrt 2 } {\frac{{{x^{6 - 1}}{ \mathrm{d}}x}}{{1 - {x^8}}}} \\  
=& \int_0^{1/\sqrt 2 } {\frac{{4\sqrt 2 - 8{x^3} - 4\sqrt 2 {x^4} - 8{x^5}}}{{1 - {x^8}}}{ \mathrm{d}}x} \quad \sqrt 2 x \to y\\  
=& \int_0^1 {\frac{{16y - 16}}{{{y^4} - 2{y^3} + 4y - 4}}{ \mathrm{d}}y} \\  
=& \int_0^1 {\frac{{4y}}{{{y^2} - 2}}{ \mathrm{d}}y} - \int_0^1 {\frac{{4y - 8}}{{{y^2} - 2y + 2}}{ \mathrm{d}}y} \\  
=& 4\left. {\left[ {\frac{1}{2}\ln ({y^2} - 2)} \right]} \right|\_0^1 - 4\left. {\left[ {\frac{1}{2}\ln ({y^2} - 2y + 2) + \arctan (1 - y)} \right]} \right|\_0^1\\  
=& - \ln 4 - ( - \pi - \ln 4)\\  
=& \pi \\  
\end{aligned}$$ [/shortcode_spoiler] 

BBP类算法(BBP-Type Algorithm)就是形如$\displaystyle {\alpha =\sum _{k=0}^{\infty }\left[{\frac {1}{b^{k}}}{\frac {p(k)}{q(k)}}\right]}$的一类公式,其中$\alpha$是目标常数,$p,q$是整系数多项式,$b > 1$表示移位用的进制.

因为这个形式,所以我们可以采用 **Bailey-<span id="MathJax-Element-19-Frame" class="MathJax" tabindex="0" data-mathml="<math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;><mi>P</mi></math>"><span id="MathJax-Span-182" class="math"><span id="MathJax-Span-183" class="mrow"><span id="MathJax-Span-184" class="mi">P</span></span></span></span>记号** 来表示一个BBP公式.

$$P(\color{green}s,\color{blue}b,\color{red}n,A)=\sum_{k=0}^\infty \frac1{\color{blue}b^k}\sum_{j=1}^{\color{red}n} \frac{a_j}{(\color{red}nk+j)^\color{green}s}$$ 

所以上面这个公式就能记为:

$$\begin{aligned}  
\pi &=\sum_{k=0}^\infty \frac1{\color{blue}{16}^k}\bigg(\frac4{(\color{red}8k+1)^\color{green}1}-\frac2{(\color{red}8k+4)^\color{green}1}-\frac1{(\color{red}8k+5)^\color{green}1}-\frac1{(\color{red}8k+6)^\color{green}1}\bigg)\\  
&= P(\color{green}1,\color{blue}{16},\color{red}8,(4,0,0,−2,−1,−1,0,0))  
\end{aligned} $$ 

我写了一个BaileyP记号到级数的转换器:

<pre class="lang:mathematica decode:true" title="Bailey’s P-notation">BaileyP[s_,b_,n_,A_]:=Block[{k,echo},
  echo=Evaluate[1/b^k  Plus@@(A/Array[(n k+#)&,n])];
  Echo[Inactivate@Sum[echo,{k,0,Infinity}],"和式展开: "]];

BaileyP[1,16,8,{4,0,0,-2,-1,-1,0,0}]//Activate
%//FullSimplify</pre>

突然想到有个Hurwitz-Lerch超越函数就是这么定义的:$$\Phi (z,s,a) = \sum\limits_{k = 0}^\infty  {{z^k}} {(a + k)^{ - s}}$$ 

所以这个级数还能写成:

$$\sum\limits_{k = 0}^\infty  {\frac{1}{{{b^k}}}\frac{1}{{{{(j + kn)}^s}}}}  = \frac{1}{{{n^s}}}\Phi \left( {\frac{1}{b},s,\frac{j}{n}} \right)$$ 

---

BBP公式本身收敛远远慢于拉马努金类公式,<span style="color: #ff0000;">直接计算级数值不叫BBP算法</span>.

<span style="color: #ff0000;"><strong>BBP算法能跳过前面的位数直接计算目标位数</strong></span>,其优越性在于能够分布式计算.

传统的圆周率计算必须计算前$n$位,这需要巨大的空间消耗,而BBP公式能直接从指定位置开始计算,不需要巨大的内存和计算能力.

这同时还能用于**测试其他算法的正确性**,以前在你也算到这么多位数以前是无法知道别人是否算对的.而现在能直接对对方的计算结果进行测试,如果所有随机测试全部正确就可以认为对方计算正确.

这极大的节省了计算力.

其原理其实并不复杂,以$\pi$的计算为例.

两边乘以$16^n$来跳过n个16进位,相当于十进制中的 乘10小数点右移一位.

$$\begin{aligned}  
\pi &= \sum_{k = 0}^{\infty} \frac{1}{16^k} \left( \frac{4}{8k + 1} - \frac{2}{8k + 4} - \frac{1}{8k + 5} - \frac{1}{8k + 6} \right)\\  
16^{n} \pi &= \sum_{k = 0}^{\infty} \left( \frac{4 \cdot 16^{k-n}}{8k + 1} - \frac{2\cdot 16^{k-n}}{8k + 4} - \frac{ 16^{k-n}}{8k + 5} - \frac{16^{k-n}}{8k + 6} \right)  
\end{aligned} $$ 

两边取小数部分,如果需要的位数比较多可以$\mod 1$,然后使用快速幂模加速.

$$\begin{aligned}  
\{ {16^n}\pi \} &= \left\{ {\sum\limits_{k = 0}^\infty {\left( {\frac{{4 \cdot {{16}^{k - n}}}}{{8k + 1}} - \frac{{2 \cdot {{16}^{k - n}}}}{{8k + 4}} - \frac{{{{16}^{k - n}}}}{{8k + 5}} - \frac{{{{16}^{k - n}}}}{{8k + 6}}} \right)} } \right\}\\  
&= \{ 4\{ {16^n}{S\_1}\} - 2\{ {16^n}{S\_4}\} - \{ {16^n}{S\_5}\} - \{ {16^n}{S\_6}\} \} \\  
\{ {16^n}{S\_j}\} &= \left\{ {\left\{ {\sum_{k = 0}^n {\frac{{{{16}^{n - k}}}}{{8k + j}}} } \right\} + \sum\limits_{k = n + 1}^\infty {\frac{{{{16}^{n - k}}}}{{8k + j}}} } \right\}\\  
&= \left\{ {\left\{ {\sum_{k = 0}^n {\frac{{{{16}^{n - k}}\quad \bmod \,8k + j}}{{8k + j}}} } \right\} + \sum_{k = n + 1}^\infty {\frac{{{{16}^{n - k}}}}{{8k + j}}} } \right\}\\  
\end{aligned} $$ 

---

一般对于相应的$b,n$值,系数线性相关.

$n=8$时一般化的公式长成这个样子:

$$\pi  = \sum\limits_{k = 0}^\infty  {{{\left( {\frac{1}{{16}}} \right)}^k}} \left( {\frac{{8r + 4}}{{8k + 1}} - \frac{{8r}}{{8k + 2}} - \frac{{4r}}{{8k + 3}} - \frac{{8r + 2}}{{8k + 4}} - \frac{{2r + 1}}{{8k + 5}} - \frac{{2r + 1}}{{8k + 6}} + \frac{r}{{8k + 7}}} \right)$$ 

最初的BBP公式靠猜发现,不知道三位大神怎么想到去猜这个东西.

BBP公式的原理现在并不是完全清楚,BBP公式并不能用来计算如$e,\gamma$这样的其他数学常数.

大量的BBP公式靠PSLQ算法发现,也就是整数关系侦查算法,说白了就是研究如何猜的算法...

由此促进了一门研究猜公式的学科的发展\---\---实验数学(<a href="https://en.wikipedia.org/wiki/Experimental_mathematics" target="_blank" rel="noopener">Experimental Mathematics</a>)...

倘若拉马努金在世一定能为这个学科做出重大贡献,要在茫茫沙海中淘到金子非强大的数学直觉不能做到...

---

理论方面,一些BBP公式来源于黎曼Zeta函数、多对数函数Li和反正切函数.由于$\zeta$函数和$\pi$的关系使得这种式子在特定的时候能用来计算圆周率$\pi$和卡特兰常数$G$.

公式中取$s=p$时总能表示出$\zeta(p)$,有数学家相信这能揭示$\zeta(3)$与$\pi^3$的深层关系. [shortcode_spoiler title="与Zeta函数相关的公式" style="fancy" icon="plus-circle"] 

$$\begin{aligned}  
\pi &= \frac{1}{2}\sum\limits_{k = 0}^\infty {\frac{1}{{{{16}^k}}}} \left( {\frac{8}{{8k + 2}} + \frac{4}{{8k + 3}} + \frac{4}{{8k + 4}} - \frac{1}{{8k + 7}}} \right)\\  
\zeta (2) &= \frac{{{\pi ^2}}}{6} = \frac{3}{{16}}\sum\limits_{k = 0}^\infty {\frac{1}{{{{64}^k}}}} \left( {\frac{{16}}{{{{(6k + 1)}^2}}} - \frac{{24}}{{{{(6k + 2)}^2}}} - \frac{8}{{{{(6k + 3)}^2}}} - \frac{6}{{{{(6k + 4)}^2}}} + \frac{1}{{{{(6k + 5)}^2}}}} \right)\\  
\zeta (3) &= \frac{9}{{224}}\sum\limits_{k = 0}^\infty {\frac{1}{{{{4096}^k}}}}  
\left( \begin{aligned}  
&\frac{{1024}}{{{{(24k + 2)}^3}}} - \frac{{3072}}{{{{(24k + 3)}^3}}} + \frac{{512}}{{{{(24k + 4)}^3}}} + \frac{{1024}}{{{{(24k + 6)}^3}}} + \frac{{1152}}{{{{(24k + 8)}^3}}}\\  
+& \frac{{384}}{{{{(24k + 9)}^3}}} + \frac{{64}}{{{{(24k + 10)}^3}}} + \frac{{128}}{{{{(24k + 12)}^3}}} + \frac{{16}}{{{{(24k + 14)}^3}}} + \frac{{48}}{{{{(24k + 15)}^3}}} + \frac{{72}}{{{{(24k + 16)}^3}}}\\  
+& \frac{{16}}{{{{(24k + 18)}^3}}} + \frac{2}{{{{(24k + 20)}^3}}} - \frac{6}{{{{(24k + 21)}^3}}} + \frac{1}{{{{(24k + 22)}^3}}}\\  
\end{aligned} \right)\\  
\end{aligned}$$ [/shortcode_spoiler] 

反余切函数和对数函数能比较容易的用P记号展开.

$$\begin{aligned}  
\operatorname{arccot} b &= \arctan {\frac {1}{b}}\\  
&={\frac {1}{b}}-{\frac {1}{b^{3}3}}+{\frac {1}{b^{5}5}}-{\frac {1}{b^{7}7}}+{\frac {1}{b^{9}9}}+\cdots \\  
&=\sum _{k=1}^{\infty }\left[{\frac {1}{b^{k}}}{\frac {\sin {\frac {k\pi }{2}}}{k}}\right]\\  
&={\frac {1}{b}}\sum _{k=0}^{\infty }\left[{\frac {1}{b^{4k}}}\left({\frac {1}{4k+1}}+{\frac {-b^{-2}}{4k+3}}\right)\right]\\  
&={\frac {1}{b}}P\left(1,b^{4},4,(1,0,-b^{-2},0)\right)\\  
\ln \left( {1 - \frac{1}{{{b^m}}}} \right) &= - \frac{1}{{{b^m}}}\sum\limits_{k = 0}^\infty {\frac{1}{{1 + k}}{b^{ - mk}}} \\  
&= - \frac{1}{{{b^m}}}P(1,{b^m},1,(1))\\  
\end{aligned}$$ 

另外进位$b$只要不等于1就行了,等于小数那是无所谓的...比如黄金分割进制中表示$\pi$.

$${\pi ^2} = \sum\limits_{k = 0}^\infty  {\frac{1}{{{\phi ^{5k}}}}\left( {\frac{{{\phi ^{ - 2}}}}{{{{\left( {5k + 1} \right)}^2}}} - \frac{{{\phi ^{ - 1}}}}{{{{\left( {5k + 2} \right)}^2}}} - \frac{{{\phi ^{ - 2}}}}{{{{\left( {5k + 3} \right)}^2}}} + \frac{{{\phi ^{ - 5}}}}{{{{\left( {5k + 4} \right)}^2}}} + \frac{{2{\phi ^{ - 5}}}}{{{{\left( {5k + 5} \right)}^2}}}} \right)} $$ 

这里$\displaystyle {\phi  = \frac{1}{2}\left( {\sqrt 5  + 1} \right)}$,不是0.618...

另外附上我发现的可能是最短的计算$\pi$的BBP公式:

$$\sum\limits_{k = 0}^\infty  {\frac{{{{( - 1)}^k}}}{{{4^k}}}\left( {\frac{2}{{4k + 1}} + \frac{2}{{4k + 2}} + \frac{1}{{4k + 3}}} \right)} $$ 

更小的系数应该是不存在的

$$\sum_{k = 0}^\infty  {\frac{1}{{{2^k}}}\left( {\frac{{{a\_1}}}{{2k + 1}} + \frac{{{a\_2}}}{{2k + 2}}} \right)}  = {a\_2}\log (2) + \sqrt 2 {a_1}{\sinh ^{ - 1}}(1)$$