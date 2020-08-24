---
title: 数字黑洞IV:回文黑洞
author: Aster
type: post
date: 2015-11-16T16:25:14+00:00
url: /2015/11/number_blackhole_4/
featured_image: /wp-content/uploads/2015/11/Number_Blackhole_4_BG-100x75.jpg
duoshuo_thread_id:
  - "6373465152380994305"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - Haskell
  - 数字黑洞

---
两边对称的数被称为回文数,比如11,比如121,个位数算不算有争议,我一般是计入个位数的.

有个猜想说任意数字,将其反转与原数字相加后一定能得到回文数,举个例子196,你们可以手算验证下这个猜想.

说到数字反转,还有个和数字重排有关的猜想,将一个数字从大到小排列,再减去其从小到大的排列,最后一定能得到6147.

<!--more-->

我感觉这俩结论有点小问题啊,我决定编个程序验证下.

<pre class="height-set:false lang:haskell decode:true">import Data.Char
import Data.List
--数字转换为表
--表转化为数字
numTlist :: Show a => a -> [Int]
listTnum :: [Int] -> Int
numTlist x = map digitToInt (show x)
listTnum x =read(map intToDigit x)::Int
--给出较大值和较小值
kaprekar :: Show a => a -> Int
smaller x= sort $ numTlist x
bigger x = reverse $ smaller x
kaprekar x = listTnum (bigger x) - (listTnum (smaller x))

--卡普雷数列
buildkaprchain :: [Int] -> Maybe (Int, [Int])
buildkaprchain (n:ns)
 |elem n ns = Nothing
 |otherwise = Just(n,kaprekar n:n:ns)
--产生迭代表
listkapr :: Int -> [Int]
listkapr n = unfoldr buildkaprchain [n]
--产生从a到b的迭代列表的长度
lengthkapr :: Int -> Int -> [Int]
lengthkapr a b = map length $ map listkapr [a..b]
--取出最后一个元素组成表
takekapr :: Int -> Int -> [Int]
takekapr a b = map last $ map listkapr [a..b]
--统计a到b中各个长度出现的频率
staskapr :: Int -> Int -> [(Int, Int)]
staskapr a b = map (\l@(x:xs)->(x,length l)).group.sort $ lengthkapr a b
--统计a到b中的稳定点分布
stasspec a b = map (\l@(x:xs)->(x,length l)).group.sort $ takekapr a b

--回文运算
next :: Integer -> Integer
reverseNum = read.reverse.show
next x = x + reverseNum x
--回文判定
palindrome :: Show a => a -> Bool
palindrome x =
  sx == reverse sx
    where sx = show x 
--a到b范围内达到迭代上限n仍不收敛的数
lychlist :: Integer -> Integer -> Int -> [Integer]
lychrel n = not.any palindrome.(take n).tail.iterate next
lychlist a b n = filter (lychrel n) [a..b]</pre>

我们来求10086:86100-168=85932 → 98532 - 23589 = 74943 → 97443 -34479 = 62964 →  96642 -24669=71973 →97731-13779=83952→98532-23589=74943

唉,循环了,我在哪边看到写了必定收敛的来着...

嗯,不开玩笑了,事实上四位数,除特殊的回文数外都会变成6147,这个过程叫做**卡普雷历程**(Kaprekar's Routine),6147叫卡普雷常数,不叫卡普雷数,那又是一个新的东西,这里不研究.

根据数字黑洞的性质,我们把这个称为卡普雷黑洞

<span class="lang:haskell decode:true crayon-inline">staskapr 0 9999 = [(1,3),(2,530),(3,786),(4,2386),(5,1338),(6,1453),(7,1524),(8,1980)]</span>

 

卡普雷黑洞收敛速度非常快,10000以下最多7步即可收敛,给收敛步数附色看起来是这样的:

<a rel=""><img class="" alt="" width="" height="" /><img class="alignnone size-full wp-image-142" src="http://geis.xyz/wp-content/uploads/2015/11/Kaprekar_Blackhole.png" alt="" width="508" height="508" /></a>

<span class="lang:haskell decode:true crayon-inline">stasspec 0 9999 = [(0,237),(495,840),(6174,8923)]</span>

可以看出10000以下只有0,495,6174三个最终结果,事实上三位以下的数和一些回文数都会收敛到0,其他三位数都收敛到495,其他四位数都收敛到6147.

自然而然的我们提出两个问题,所有的数都会收敛吗?当然不,还会循环,一般来说K位数都会收敛到0或者K位收敛点或者收敛循环...呃,那么,这类数的个数是无限的吗?

我们可以试着构造一下,让我想想怎么办好,先多找几个出来

<pre class="lang:haskell decode:true">stasspec 1 1000000=[(0,442),(495,840),(6174,8923),(53955,415),(59994,2587),(61974,5808),(62964,5816),(63954,4770),(71973,4840),(74943,4754),(75933,24164),(82962,9028),(83952,27724),(420876,262016),(549945,1815),(631764,56180),(642654,318913),(750843,53890),(840852,117940),(851742,34295),(860832,30640),(862632,24200)] (156.98 secs, 291,332,137,192 bytes)</pre>

我没看出啥规律,然后我就去做了几个大数运算,发现几个数字在最后的收敛结果中连续出现.思考了一下,一次操作的结果只和这个数包含哪些数字有关,可以在原来收敛的数的基础上嵌入成对的数,比如2和4,3和6,4和8,然后这两个数又正好对称分布在生成的数两边,相减时 大数-小数=小数 没有变化.

495→459这没法嵌,6147→1467,可以对称嵌入3和6,134667,运算下得到631764,确实是卡普雷常数,插两个13346667得63317664也是,因为倒序时 N个6-N个3总是N个3 所以这样就能生成无限个卡普雷常数.

再拿一个631764→134667→13346667→63317664 再插一个 1333466667→6333176664,于是我们就找出了一类卡普雷常数,由较小的卡普雷常数派生得到.

虽然证明了卡普雷常数的无限性,然而还有更多的问题可以问,卡普雷常数在自然数中的比例时候和质数一样有估计公式,时候任意N位数(N>2)都有卡普雷常数存在,是否都有卡普雷循环存在......

这里不做深入研究,来看另一个问题.话说那边那个验算196的孩子验算完没有啊,等着你验算成功给你发**菲尔兹奖**呢.

因为这个迭代序列是递增的,为了防止爆掉内存最好规定下迭代上限,<span class="lang:haskell decode:true crayon-inline">length $ lychlist 1 10000 50 = 249</span> ,说明有2.49%的数无法在50步以内收敛,事实上30年来196已经被迭代了上亿次仍没有收敛,所以利克瑞尔,好吧,没这个人,韦德认为有些数永远不会收敛.回文猜想至今未被证明,利克瑞尔猜想也没被证明.

吐槽下,世界上有很多很多的猜想浪费着计算资源,Paul Graham说过如果世界上增加了100倍的计算能力,那么绝大部分会被浪费掉,从计算机这么多年的发展历史来看确实是睿智之语.

去学COQ都比无脑找反例好得多,看他们不算的推荐入坑[<span style="text-decoration: underline; color: #0000ff;">https://coq.inria.fr/</span>][1]

 [1]: https://coq.inria.fr/