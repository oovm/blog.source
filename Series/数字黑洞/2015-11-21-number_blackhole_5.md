---
title: 数字黑洞 V: 角谷猜想
author: Aster
type: post
date: 2015-11-21T12:29:46+00:00
url: /2015/11/number_blackhole_5/
featured_image: /wp-content/uploads/2015/11/Number_Blackhole_5_BG-100x75.jpg
duoshuo_thread_id:
  - "6373465152481657602"
categories:
  - CODE➤GEASS
  - 理宅异闻录
tags:
  - Haskell
  - 数字黑洞

---
上面说了那么多, 我们终于进入了最终章, 有请被誉为费马大定理继承者的角谷猜想出场!!!

> 对任意自然数, 如果是奇数就乘 3 加 1, 如果是偶数就除以 2. 经过有限次操作后一定能收敛到 4→2→1 循环.

随便举几个例子, 比如三的次幂 3→10→5→16→8→4→2→1 然后是 9→28→14→7→22→11→34→17→52→26→13→40→20→10→5→16→8→4→2→1, 然后你可以手算验证下 27.

详细信息参考 https://en.wikipedia.org/wiki/Collatz_conjecture, 还有为啥要叫角谷猜想呐, 找不到他的 Paper 啊?

<!--more-->

---

下面给出一个朴素的算法, 朴素的算法易于修改和推广嘛, 即便现有的高度优化的算法能把常数因子缩小 10000 倍以上, 不降低复杂度就没必要增加理解难度

```hs
import Data.List
import Data.Ord
-- 定义 collatz 操作
collatz 1 = 1-- 截断迭代
collatz x
 | even x = x `div` 2
 | otherwise = 3 * x + 1
-- 给出收敛路径
collatzl :: Integral t => t -> [t]
collatzl n
 | n < 1 = error "Please enter Positive Integer!"
 | n == 1 = [n]
 | otherwise = n:collatzl (collatz n)
 -- 给出收敛到 1 所需的步数
collatzll :: Integral a => a -> Int
collatzll n = length(collatzl n)
-- 收敛路径中出现的最大值
collatzlm :: Integral a => a -> a
collatzlm n = maximum(collatzl n)
-- 统计函数
stastep n = map (\l@(x:xs)->(x,length l)).group.sort $ map collatzll [1..n]
stamax n = map (\l@(x:xs)->(x,length l)).group.sort $ map collatzlm [1..n]
foo n = sortBy (comparing snd) $ stamax n
```

比较正统的研究和分布式运算能在这里找到 <span style="color: #0000ff;"><a style="color: #0000ff;" href="http://www.equn.com/3x+1/"><span style="text-decoration: underline;">http://www.equn.com/3x+1/</span></a></span>

这里给出分析结果, 分辨率 2000+, 点击可以查看超超超清大图.

** 左上横轴为 n, 竖轴为迭代步数       右上是相应的统计数据, 也就是对 stastep n 作图 **

** 左下横轴为 n, 竖轴为迭代最大值    右下是相应的统计数据, 也就是对 stamax n 作图 **

100 以下的分布图, 似乎什么也看不出, 左上图似乎有连续两个或三个数迭代步数是相同的

![](../wp-content/uploads/2015/11/Collatz100.png)

---

1000 以下的分布图, 左下图的一条横线很显眼, 在右下表现为突兀的竖线, 这个数是 9232, 仔细看图可以发现下面隐约还有一条线 4372 也有如此性质

同时左上图看上去感觉形成了某种图形, 需要更多的点来使其完整呈现.

![](../wp-content/uploads/2015/11/Collatz1000.png)

---

下面是 10000 以下的分析, 我特意看了下数据 1~9232 的数中, 9232 出现了 1579 次, 17.1%, 另外 2 的次幂出现的极少, 几乎没有. 可以看出迭代步数分布似乎形成了某种图形, 而迭代最大值分布由斜线和直线构成.

![](../wp-content/uploads/2015/11/Collatz10000.png)

---

最后来一张百万级的分析图, 看图形猜想, 右上是两个偏态分布的叠加, 右下呈反比例.

要是不存在一个数的迭代步数或者迭代最大值无穷大, 那么猜想不就获证了? 但这种情况无视了其他循环的情况, 认为只有 4→2→1→4 循环的存在, 另外还得证明不存在其他循环.

另外运用概率方法可以发现, 几乎所有数经过有限次迭代以后都会小于原来的数, 几乎就是随着 n 的增大, 概率逐渐变小趋近于 0 的意思, 如果能证明所有的数都如此, 那猜想也就获证了.

![](../wp-content/uploads/2015/11/Collatz1000000.png)

注意下面用的对数尺标, 还有点图画不出来了, 画出来一坨黑...

---

从图上看似乎很有规律, 但实际分析却很难找出规律.

对于左下图来说, 显然所有的点都是偶数, 但那些横线代表什么? 为什么有的是强横线 (粗的, 明显的), 有的是弱横线 (细的, 不明显的)? 52,160,304,808,2752,4372,9232.... 找不到任何规律. 斜线最下一条是 y=n, 指那些一开始就不断递减的数, 比如 2^n, 往上的线是什么呢? 是否所有的点都在横线或斜线上? 什么样的数会落在横线上, 哪些又会落在斜线上? 期待数论高手为我讲解.

左上图很明显的显示出了自相似的性质, So What?

一般来说取奇偶的函数可以写成 (-1)^n 或者 $\cos (\pi z)$ 的初等形式, 一般不用指数式, 因为 - 1 的实数幂有点复杂. 所以讲奇偶式写成三角式是这样的.

$$f(z) = \frac{1}{4}[2 + 7z - (2 + 5z)\cos (\pi z)]$$

把这个式子翻译到 $Ultra Fractal$ 中

```cpp
Collatz {
  init:
    z = #pixel
  loop:
    z = (1+4*z-(1+2*z)*Cos(pi*z))/4
  bailout:
    |z| <= @bailout
  default:
    title = "Collatz"
  switch:
}
```

把 bailout 的实部调到 10000 得到这样的图形 **Collatz Fractal:**

![](../wp-content/uploads/2015/11/Collatz-Fractal.jpg)

为啥是 $3n+1$ 而不是 $5n+2$ 之类的呢, 为什么不检测负数呢? 嗯, 你很善于思考嘛, 其实一般化问题也有人研究过了.

已知结论有 $3n+1$ 对于负数有三个循环, 是否有其他循环不得而知. 上面这个程序是无法作用于负数的, 但是前面求水仙花数的那个程序可以求.

另外对于 $pn+q$, 一个可怕的结论是总存在一些 (p,q) 对, 无法证明也无法被推翻, 可以说是哥德尔不完备性定理的一种体现吧, 希望 $3n+1$ 猜想不在里面.