---
title: 数字黑洞I:水仙花数
author: Aster
type: post
date: 2015-11-06T04:05:31+00:00
url: /2015/11/number_blackhole_1/
featured_image: /wp-content/uploads/2015/11/Number_Blackhole_1_BG-100x56.jpg
duoshuo_thread_id:
  - "6373465143187079937"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - Haskell
  - 数字黑洞

---
水仙花数是指**一个 n 位数，它的每个位上的数字的 n 次幂之和等于它本身**的数.比如153: $$153 = {1^3} + {5^3} + {3^3}$$

当然要求不那么严格的话,还可以定义广义水仙花数:**每个位上的数字的 n 次幂之和等于它本身**

<!--more-->

根据以上定义很容易给出一个穷举算法.

<pre class="lang:haskell decode:true">--给出 p 位数的水仙花数
daffodil :: Integral b => b -> [Int]
daffodil p  =  [ x | x <- [m..n],x== xpower x p] where m =10^(p-1); n=10^p-1
xpower x p =sum $ map (^p) (numTlist x)

--给出 p 次的广义水仙花数
daffodilg :: Integral b => b -> [Int]
daffodilg p =[x | x <- [1..n], x == (sum . map ((^p) . digitToInt) . show) x] where n=10^(p+1)</pre>

嗯,其实水仙花数和Daffodil一点关系也没有,可能是因为有的地方叫做自幂数,或者自恋数,然后和希腊神话中的纳西索斯(Narcissus)联系上了,然后翻译来翻译去就这样了.以下还是根据比较大众的说法叫水仙花数.事实上看英文起源的话水仙花就是自恋的意思,所以水仙花数完全等价于自幂数,中文百科上说水仙花数是自幂数的一种的说法是完全错误的,还搞笑的给不同位数取了不同名字.而且n也不必限定n>3.

> 参考英文Wiki.
> 
> A narcissistic number is a number that is the sum of its own digits each raised to the power of the number of digits. This definition depends on the base b of the number system used.
> 
> 水仙花数是指那些每个位上的数字的 n 次幂之和等于它本身的数,这个定义还取决于数字的进制.

所以水仙花数一般叫 **Narcissistic Number**,或者**Armstrong Mumber**.学术一点叫超完全数字不变数**PluPerfect Digital Invariant** (**PPDI**).广义水仙花数那就是完全数字不变数**Perfect Digital Invariant(PDI).**显然PPDI是PDI的真子集.

这个算法在位数比较低时还是可以应付的,可以看出,水仙花数在自然数中十分稀疏,事实上PPDI是有限的.这里给出一个粗略的十进制中的上界估计.

p位数,最大p个9,最小1后面跟p-1个0,就算它全是9吧,这样得到的自幂值最大为$p \times {9^p}$,另一边p位数的最小值是${10^{p - 1}}$,在Mathematics中输入N[Reduce[p*9^p > 10^(p - 1), p]]得到结果0.101071 < p < 60.8479,说明不存在超过60位的十进制水仙花数.

既然得到了肯定的回答,那么我们就去找到所有的十进制水仙花数吧.呃,可惜我还没有用Haskell写出能在5分钟内遍历1-60位的搜索函数.这边有个C#程序<span style="text-decoration: underline; color: #0000ff;"><a style="color: #0000ff; text-decoration: underline;" href="http://bbs.csdn.net/topics/360188055">http://bbs.csdn.net/topics/360188055</a></span>

> 十进制水仙花数一共有88个,最大的是115132219018763992565095597973971522401,共39位.

另外我很奇怪中文百科上限定了n>3,那么不算1-9是怎么数出来88个的,中文百科沦落为电子垃圾很大程度上就是因为不加验证的去各处扒结论,没有经过思考的东西终究只是废话.