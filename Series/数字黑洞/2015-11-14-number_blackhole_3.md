\title: 数字黑洞 II: 数位黑洞
\date: 2013-11-14 05:34:30
\cats: Number Theory

水仙花数就告一段落了, 下面来讲一些其他在数位上做文章的数字黑洞.

也许有人知道 145 的特殊性质 $145 = 1! + 4! + 5!$, 这类数被称为 **Factorion,** 这类数是否有限呢.

> A factorion is a natural number that equals the sum of the factorials of its decimal digits.
>
> 自阶乘数是指那些各位阶乘的和等于其本身的数, 该定义同样依赖于进制.

同之前的粗略证明, p 位数,${10^{p - 1}}\sim {10^p} - 1$, 这样得到的自阶乘值最大为 p×9!,p 位数的最小值是 ${10^{p - 1}}$, 在 Mathematics 中输入 N[Reduce[p×9!> 10^(p - 1), p]] 得到结果 p < 7.4308, 说明不存在超过 7 位的十进制自阶乘数.

<!--more-->

---

3435 有个性质 $3435 = {3^3} + {4^4} + {3^3} + {5^5}$, 这类数称为 **Münchhausen Number**, 这应该才叫做自幂数, 但是由于翻译问题这个词是水仙花数的意思 O__O ""… 证明同上.

> A perfect digit-to-digit invariant (PDDI) (also known as a Canouchi number or Münchhausen Number,) is a natural number that is equal to the sum of its digits each raised to a power equal to the digit.
>
> 自幂数是指那些各位自幂的和等于其本身的数, 该定义同样依赖于进制.

在 Mathematics 中输入 N[Reduce[p×9^9> 10^(p - 1), p]] 得到结果  p < 10.6141, 说明不存在超过 10 位的十进制自幂数. PDDI 定义中 ${0^0}$ 被定义为 0, 但是用洛必达的话可以得到 ${0^0} = 1$, 这样规定的原因不明, 可能是因为规定成 1 的话就更加稀疏了.

---

下面我们编程进行研究:

```hs
import Data.List
import Data.Char
-- 阶乘函数
factchain :: Int -> Int
factchain = sum.map(fact.digitToInt).show
 where fact n = product [1..n]
buildfactchain (n:ns)
 |elem n ns = Nothing
 |otherwise = Just(n,factchain n:n:ns)
-- 产生阶乘函数迭代表
listfact :: Int -> [Int]
listfact n = unfoldr buildfactchain [n]
-- 产生从 a 到 b 的迭代列表的长度
lengthfact a b = map length $ map listfact [a..b]
-- 取出最后一个元素组成表
takefact a b = map last $ map listfact [a..b]
-- 统计 a 到 b 中各个长度出现的频率
stasfact a b = map (\l@(x:xs)->(x,length l)).group.sort $ lengthfact a b
factspec a b = map (\l@(x:xs)->(x,length l)).group.sort $ takefact a b

-- 自幂函数
sexpchain :: Int -> Int
sexpchain = sum.map(sexp.digitToInt).show
 where sexp 0 = 1
 sexp n = n^n
buildsexpchain (n:ns)
 |elem n ns = Nothing
 |otherwise = Just(n,sexpchain n:n:ns)
-- 产生自幂函数迭代表
listsexp :: Int -> [Int]
listsexp n = unfoldr buildsexpchain [n]
-- 产生从 a 到 b 的迭代列表的长度
lengthsexp a b = map length $ map listsexp [a..b]
-- 取出最后一个元素组成表
takesexp a b = map last $ map listsexp [a..b]
-- 统计 a 到 b 中各个长度出现的频率
stassexp a b = map (\l@(x:xs)->(x,length l)).group.sort $ lengthsexp a b
sexpspec a b = map (\l@(x:xs)->(x,length l)).group.sort $ takesexp a b
```

---

可以发现, 这些数字都有黑洞性质, 事实上对于进位的操作, 由于 ${N^p}$ 的快速增长特性都有黑洞性质, 比如取斐波那契第 n 项这种都逃不出这个黑洞, 可以说 ${N^p}$ 就是数位黑洞的逃逸速度. 研究的方法都是差不多的我就不多说了. 有兴趣的可以深入研究下.


还有一些其他有趣的数, 比如说

> A **Dudeney Number** is a positive integer that is a perfect cube such that the sum of its decimal digits is equal to the cube root of the number.
>
> 1= 1 x 1 x 1<span class="">  </span>; 1 <span class=""> </span> = 1
>
> 512= 8 x 8 x 8<span class="">  </span>; 8 <span class=""> </span> = 5 + 1 + 2
>
> 4913= 17 x 17 x 17<span class="">  </span>; 17 = 4 + 9 + 1 + 3
>
> 5832= 18 x 18 x 18<span class="">  </span>; 18 = 5 + 8 + 3 + 2
>
> 17576= 26 x 26 x 26<span class="">  </span>; 26 = 1 + 7 + 5 + 7 + 6
>
> 19683= 27 x 27 x 27<span class="">  </span>; 27 = 1 + 9 + 6 + 8 + 3



> A **Sum-Product Number** is an integer that in a given base is equal to the sum of its digits times the product of its digits.
>
> 144= (1 + 4 + 4)(1 × 4 × 4)

$$N = \sum_{i = 1}^l {{d\_i}} \prod_{i = j}^l {{d\_j}} $$

回顾一下, 这几章学了, 呃, 一大堆英文:

Additive Persistence  |  Digitaddition  |  Aigital Root  |  Harshad Number  |  Kaprekar Number  |  Münchhausen Number  |  Multiplicative Digital Root  |  Multiplicative Persistence  |  Powerful Number  |  Recurring Digital Invariant  |  Vampire Number 什么的....

你还可以构建个 k 位是 k 次的这种, 求和真因数啊, 用上欧拉函数啊, 莫比乌斯函数啊什么什么的装逼利器... 好吧, 不说这个话题了, 我快吐了.