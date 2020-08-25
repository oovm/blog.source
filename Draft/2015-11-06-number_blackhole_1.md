\title: 数字黑洞 I: 水仙花数
\url: number_blackhole_1
\date: 2013-11-06 04:05:31
\cats: Number Theory
\tags: haskell

水仙花数是指**一个 n 位数，它的每个数位上的数字的 n 次幂之和等于它本身**的数.

比如 153: $$153 = {1^3} + {5^3} + {3^3}$$

当然要求不那么严格的话, 还可以定义广义水仙花数: **每个数位上的数字的 n 次幂之和等于它本身**的数.

\read_more

根据以上定义很容易给出一个穷举算法.

```hs
-- 给出 p 位数的水仙花数
daffodil :: Integral b => b -> [Int]
daffodil p = [x | x <- [m..n], x== xpower x p] where m=10^(p-1); n=10^p-1
xpower x p = sum $ map (^p) (numTlist x)

-- 给出 p 次的广义水仙花数
daffodilg :: Integral b => b -> [Int]
daffodilg p =[x | x <- [1..n], x == (sum . map ((^p) . digitToInt) . show) x] where n=10^(p+1)
```

嗯, 其实水仙花数和 Daffodil 一点关系也没有, 可能是因为有的地方叫做自幂数, 或者自恋数, 然后和希腊神话中的纳西索斯 (Narcissus) 联系上了, 然后翻译来翻译去就这样了. 以下还是根据比较大众的说法叫水仙花数. 事实上看英文起源的话水仙花就是自恋的意思, 所以水仙花数完全等价于自幂数, 中文百科上说水仙花数是自幂数的一种的说法是完全错误的, 还搞笑的给不同位数取了不同名字. 而且 n 也不必限定 n>3.

> 参考英文 Wiki.
>
> A narcissistic number is a number that is the sum of its own digits each raised to the power of the number of digits. This definition depends on the base b of the number system used.
>
> 水仙花数是指那些每个位上的数字的 n 次幂之和等于它本身的数, 这个定义还取决于数字的进制.

所以水仙花数一般叫 **Narcissistic Number**, 或者 **Armstrong Mumber**. 学术一点叫超完全数字不变数 **PluPerfect Digital Invariant** (**PPDI**). 广义水仙花数那就是完全数字不变数 **Perfect Digital Invariant(PDI).** 显然 PPDI 是 PDI 的真子集.

这个算法在位数比较低时还是可以应付的, 可以看出, 水仙花数在自然数中十分稀疏, 事实上 PPDI 是有限的. 这里给出一个粗略的十进制中的上界估计.

p 位数, 最大 p 个 9, 最小 1 后面跟 p-1 个 0, 就算它全是 9 吧, 这样得到的自幂值最大为 $p \times {9^p}$, 另一边 p 位数的最小值是 ${10^{p - 1}}$, 在 Mathematics 中输入 N[Reduce[p*9^p > 10^(p - 1), p]] 得到结果 0.101071 < p < 60.8479, 说明不存在超过 60 位的十进制水仙花数.

既然得到了肯定的回答, 那么我们就去找到所有的十进制水仙花数吧. 呃, 可惜我还没有用 Haskell 写出能在 5 分钟内遍历 1-60 位的搜索函数. 这边有个 C# 程序 http://bbs.csdn.net/topics/360188055

> 十进制水仙花数一共有 88 个, 最大的是 115132219018763992565095597973971522401, 共 39 位.

另外我很奇怪中文百科上限定了 n>3, 那么不算 1-9 是怎么数出来 88 个的, 中文百科沦落为电子垃圾很大程度上就是因为不加验证的去各处扒结论, 没有经过思考的东西终究只是废话.

上一篇博文介绍了水仙花数, 并且否决了十进制水仙花数的无穷性. 一个自然而然的问题, 是否存在进制 N 包含无穷个水仙花数?

根据同样的思路可以列出 $p \times {(N - 1)^p} > {N^{p - 1}}$

<!--more-->

在 Mathematics 中输 `Solve[p*(n - 1)^p == n^(p - 1), p]` 可解

不过我们关心的是 p 的上界与 N 的关系, 输入

`ListPlot[Flatten[p/.Table[NSolve[p*(n-1)^p==n^(p-1)&&1<p,p],{n,2,16}]]]`

来得到二进制到十六进制的 p 上限图.

> 可见对于任意 N 进制而言水仙花数都是有穷的. 不过上限会随着 N 的增大而增大.

2-16 进制的水仙花数表可以在这查到: [Narcissistic Number Data](https://github.com/GalAster/NarcissisticNumber/blob/master/data/readme.md)

---

如果你想的深远一些,, 还可以玩出很多新花样对一个数不断的重复这个操作, 你会意识到, 所谓的水仙花数不过是在这种操作下不变的量, 所以它被叫做 超完全数字不变数 (**PPDI**).

尝试下其他数, 比如对数字进行三次型操作 100→1^3+0^3+0^3=1→1^3=1, 噢, 100 被水仙花数 1 吃进去了, 试试别的

134→92→737→713→371→371

12345→225→141→66→432→99→1458→702→351→153→153

999999999→6561→558→762→567→684→792→1080→513→153→153

我想不用再试了, 对于所有的三次型操作, 最后都会三次型水仙花数或 1 吃掉! 所以 p 次型操作, 最后都会 p 次型水仙花数或 1 吃掉! 可以说这些数就像一个个黑洞, 一旦进入就永远出不来了, 于是我们可以称这种现象为

> 水仙花黑洞!

我们来写个程序验证下

```hs
import Data.List
import Data.Char
narcchain :: Int -> Int
narcchain = sum.map(narc.digitToInt).show
 where narc n = n^3
buildnarcchain (n:ns)
 |elem n ns = Nothing
 |otherwise = Just(n,narcchain n:n:ns)
-- 产生 PDI 迭代表
listnarc :: Int -> [Int]
listnarc n = unfoldr buildnarcchain [n]
-- 产生从 a 到 b 的迭代列表的长度
lengthnarc a b = map length $ map listnarc [a..b]
-- 取出最后一个元素组成表
takenarc a b = map last $ map listnarc [a..b]
-- 统计 a 到 b 中各个长度出现的频率
stasnarc a b = map (\l@(x:xs)->(x,length l)).group.sort $ lengthnarc a b
stasspec a b = map (\l@(x:xs)->(x,length l)).group.sort $ takenarc a b
```

当然你要是信了上面那段鬼话那你就是我说的看书不思考的那类人, 就算你手算验证, 验证到 4 就能发现

4→64→280→520→133→55→250→133→55

---

我们可以这样类比: 一个大质量天体附近要是满足一定的初速度的话是可以围绕其旋转的 (就叫稳定点吧), 不然的话就只有掉进去了, 掉进去了那就出不来了 (就叫奇点吧).

计算可以发现 1000 以内的稳定点有 55,133,136,160,217,244,250,352,919, 奇点有 1,153,370,371,407.

什么, 你说你想知道二次型的结论, 那简单, 把上边代码 n^3 改成 n^2 就行了. 为啥这么麻烦呢? 呃, 这段代码是从下一章抄上来的, 我写这篇文章的时候还没想出代码, 于是先写了下一章, 抄过来的就懒得改了.

最后给出个粗略的证明, 对于十进制来说 p 次型必定收敛的证明, N 进制成不成立就当我留给你们的课后作业了.

上一章说到不存在 60 位以上的水仙花数, 因为 60 位以上进行一次操作后无论如何都会减小, 而 60 位以下不是循环就是不动, 所以奇点和稳定点都是有限的. 貌似这结论对任意 N 进制都成立. 呃, 那课后作业就不布置了.