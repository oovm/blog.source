\title: 方程习题 I
\date: 2016-10-03T12:50:02
\cats: Practice, Math
\tags: fixed point, fourier transform, differential equation

> 求解傅里叶变换的不动点, 即求解积分方程 :
> $$f(x) = \mathfrak{F}(f(x)) = \int_{ - \infty }^\infty  {f(\xi ){e^{ - 2\pi ix\xi }}\mathrm{d}\xi }$$

考虑矩阵方程 ${F^4} = I$, 取

$$F = \left({\begin{array}{rrrr}
1&1&1&1 \\
1&{- {\text{i}}}&{ - 1}&{\text{i}} \\
1&{- 1}&1&{ - 1} \\
1&{\text{i}}&{ - 1}&{ - {\text{i}}}
\end{array}} \right)$$

那么存在 $\dfrac{f}{4}F = ({f_1},{f_i},{f_{ - 1}},{f_{ - i}})$ 使得 

$$\mathfrak{F}({f_1},{f_i},{f_{ - 1}},{f_{ - i}}) = ({f_1},i{f_i}, - {f_{ - 1}}, - i{f_{ - i}})$$ 

所以对于任意函数 $g\left( x \right)$, 有

$${f_1} = \frac{1}{4}\left( {1 + \mathfrak{F} + {\mathfrak{F}^2} + {\mathfrak{F}^3}} \right)g\left( x \right)$$

使得

$$\mathfrak{F}({f_1}(x)) = {f_1}(x)$$

\read_more

```wl
(* 举个例子 *)
g = E^(-x^2);
g1 = FourierTransform[g, x, t1];
g2 = FourierTransform[g1, t1, x];
g3 = FourierTransform[g2, x, t1];
(g + g1 + g2 + g3) / 4 /. t1 -> x
```

取 $g\left(x \right) = {e^{ - {x^2}}}$ 有 $f(x) = \dfrac{\sqrt 2 }{4}(\sqrt 2 {e^{ - {x^2}}} + {e^{ - \frac{x^2}{4}}})$

其他常见的解还有 

$$
\left\{ {e^{ - \frac{x^2}{2}},
\frac{1}{\sqrt[4]{x^2}},
{\text{sech}}\left( {\sqrt {\frac{\pi }{2}} x} \right)} \right\}
$$

---

> 求解函数方程 $f(x + y) = f(x)g(y) + f(y)g(x)$

该方程本质上只有如下三种解

$$\left\{\begin{aligned}
f(x) & = kx{e^{rx}},&g(x) & = {e^{rx}}\\
f(x) & = k{e^{rx}}\sin (sx),&g(x) & = {e^{rx}}\cos (sx)\\
f(x) & = k{e^{rx}}\sinh (sx),&g(x) & = {e^{rx}}\cosh (sx)\\
\end{aligned} \right.$$

证明见 [[StackExange-Mathematic][http://math.stackexchange.com/questions/444517/about-the-addition-formula-fxy-fxgyfygx/623551]]

---

求解函数方程 $f(x + y + z) = f(x)g(y) + f(y)g(z) + f(z)g(x)$

$$\begin{aligned}
0 =& f(x + y + z) - f(x)g(y) - f(y)g(z) - f(z)g(x) \\
0 =& f'(x + y + z) - f'(x)g(y) - f(z)g'(x)\\
0 =& f{''}(x + y + z) - f'(z)g'(x)\\
0 =& f{'''}(x + y + z) \\
c_1 = &{f{''}( \cdot )}\\
{c_1}z + {c_2} = &f'(z) \\
({c_1}z + {c_2})g'(x) =& c_1 \\
{c_1}g'(x) =& 0
\end{aligned} $$

假如 $g$ 不是个常函数:

$$\begin{aligned}
c_1& = 0 \\
f{''}( \cdot )& = 0 \\
f(x)& = {c2}x + c_3 \\
c_2& = {c_2}g(y) + ({c_2}z + {c_3})g'(x) \\
0& = {c_2}g'(y) \\
c_2& = 0 \\
f(x)& = c_3
\end{aligned} $$

那么 $f$ 就是常函数, $f$ 是常函数的话 $g$ 也只能是常函数, 矛盾

所以设 $g$ 是常函数, 此时假设 $f$ 不是常函数

$$\begin{aligned}
g'(x)& = 0 \\
c_1& = 0 \\
f{''}( \cdot )& = 0 \\
f(x)& = {c_2}x + c_3 \\
c_2& = {c_2}g(y) + ({c_2}z + {c_3})g'(x) \\
g(\cdot)& = 1 \\
f(0 + 0 + 0)& = 3f(0) \\
f(0)& = 0 \\
f(x) & = {c_2}x
\end{aligned}$$

综上所述, 原方程只有如下两个非平凡解

$$\left\{\begin{aligned}
f(x) &= cx,&g(x) &= 1\\
f(x) &= k,&g(x) &= \frac{1}{3}\\
\end{aligned} \right.$$

* * *

> 求解微分方程:
>
> $$\left\{\begin{aligned}
> & \mathrm{d}y(x) = \sin (y(x)){ \mathrm{d}}x\\
> &y(0) = 1\\
> \end{aligned} \right.$$

OK, 我知道这是道水题

$$\begin{aligned}
\frac{ \mathrm{d}y\left( x \right)}{\mathrm{d}x}& = \sin \left( {y\left( x \right)} \right)\\
\csc \left({y\left( x \right)} \right)\frac{\mathrm{d}y\left(x \right)}{ \mathrm{d}x} & = 1\\
\int {\csc \left( {y\left( x \right)} \right){ \mathrm{d}}y\left( x \right)} & = \int {1{ \mathrm{d}}x}\\
- \log {\cos \left( {\frac{y\left( x \right)}{2}} \right)} + \log  {\sin \left( {\frac{y\left( x \right)}{2}} \right)} & = x + {c_1}\\
y\left(x \right) & = 2\operatorname{arccot}\left({\rm{e}^{ - x - {c_1}}} \right)\\
y(x) & = 2\operatorname{arccot}\left[ {\rm{e}^{- x}\cot \frac{1}{2}} \right]\\
\end{aligned}$$

写个代码顺便把其他情况全部解出来吧:

```wl
tri = {Sin, Cos, Tan, Cot, Sec, Csc};
funs = y'[x] == #[y[x]]& /@ tri;
Quiet@DSolve[#, {y[x]}, x]& /@ funs // TableForm
```

写成公式就是:

$$\begin{aligned}
y'(x) = \sin (y(x)) &\Rightarrow y(x) = 2\operatorname{arccot} {e^{ - C - x}} \\
y'(x) = \cos (y(x)) &\Rightarrow y(x) = 2\arctan \tanh \frac{C + x}{2} \\
y'(x) = \tan (y(x)) &\Rightarrow y(x) = \arcsin {e^{C + x}}\\
y'(x) = \cot (y(x)) &\Rightarrow y(x) = \pm \arccos {e^{ - C - x}}\\
y'(x) = \sec (y(x)) &\Rightarrow y(x) = \arcsin (C + x) \\
y'(x) = \csc (y(x)) &\Rightarrow y(x) = \pm \arccos ( - C - x)
\end{aligned}$$
