\title: 数字黑洞 I: 水仙花数
\url: number_blackhole_1
\date: 2015-11-06T04:05:31+00:00
\cats:
  - CODE➤GEASS
  - 理宅异闻录
\tags:
  - Haskell
  - 数字黑洞

水仙花数是指 ** 一个 n 位数，它的每个位上的数字的 n 次幂之和等于它本身 ** 的数. 比如 153: $$153 = {1^3} + {5^3} + {3^3}$$

当然要求不那么严格的话, 还可以定义广义水仙花数:**每个位上的数字的 n 次幂之和等于它本身 **

\read_more

根据以上定义很容易给出一个穷举算法.

```hs
-- 给出 p 位数的水仙花数
daffodil :: Integral b => b -> [Int]
daffodil p  =  [x | x <- [m..n],x== xpower x p] where m =10^(p-1); n=10^p-1
xpower x p =sum $ map (^p) (numTlist x)

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

既然得到了肯定的回答, 那么我们就去找到所有的十进制水仙花数吧. 呃, 可惜我还没有用 Haskell 写出能在 5 分钟内遍历 1-60 位的搜索函数. 这边有个 C# 程序 <span style="text-decoration: underline; color: #0000ff;"><a style="color: #0000ff; text-decoration: underline;" href="http://bbs.csdn.net/topics/360188055">http://bbs.csdn.net/topics/360188055</a></span>

> 十进制水仙花数一共有 88 个, 最大的是 115132219018763992565095597973971522401, 共 39 位.

另外我很奇怪中文百科上限定了 n>3, 那么不算 1-9 是怎么数出来 88 个的, 中文百科沦落为电子垃圾很大程度上就是因为不加验证的去各处扒结论, 没有经过思考的东西终究只是废话.