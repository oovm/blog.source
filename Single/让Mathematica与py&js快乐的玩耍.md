title: 让Mathematica与py&js快乐的玩耍
tags:
  - Mathematica
  - tutorial
  - ZeroMQ
date: GMT[{2018, 2, 23, 10, 35, 35}, 8]
update: GMT[{2018, 3, 10, 12, 17, 00}, 8]
categories:
  - GALASTER'S DIMENSION
  - CODE➤GEASS
copyright: true

===

## 安装 ZeroMQ

### Win 用户

安装最新的 python, nodejs 以及 git

- Python: https://www.python.org/downloads/

- NodeJS: https://nodejs.org/en/

- GitGUI: https://git-scm.com/downloads

新建一个 sh 文件 `i sec.sh` , 里面写

```bash
#!/usr/bin/env bash
conda install pyzmq -yes || python -m pip install zmq
cd ~ && npm install zeromq && mv node_modules .node_modules
echo "Ctrl + C 退出" && sleep 86400
```

双击运行即可, 若跳警告, 统统无视即可

<!-- more -->

Win 不手操 `%Path%` 是没有 `pip` 的, 只有 `python -m pip` , 当初我学 python 被这个坑死了...

安装成功的话运行如下代码应该得到和我类似的结果

```mma
FindExternalEvaluators[][Delete[#, {#, 1, 1}&/@Range@Length@#]&]
py=StartExternalSession["Python"]
js=StartExternalSession["NodeJS"]
```

![](https://i.loli.net/2018/02/23/5a8f7fb96e9ea.png)

### Linux 用户

Linux 用户不用教, 都是大佬, 肯定能自己搞定的!

### Mac 用户

Mac 用户可以出钱请我装. 不知道写两行脚本售价 $99 有没有人买23333.

## 测试 

嗯, 其实装完 git 就能跑 bash 了.

```mma
Bash[command_String]:=RunProcess[{
    "C:\\Program Files\\Git\\bin\\bash.exe", 
    "-c", 
    command
}, "StandardOutput"]
Bash["bash --version | head -1 | tr -d '\n'"]
```

![](https://i.loli.net/2018/02/23/5a8f7fba3f404.png)

就是怎么想怎么蛋疼, 我为什么要在 Mathematica 里用bash...

等会儿, 还是有点用的, 装个库什么的...

装个 `numpy` 用用先

![](https://i.loli.net/2018/02/23/5a8f94da4d2b8.png)

可以看到下面的建议栏跳出来了, 说明数据类型已经自动转化为 Mathematica 支持的类型了, 上面的列表的写法也是Mathematica的列表写法.

试了下图片和函数都不能导出...那有什么意思啊...

![](https://i.loli.net/2018/02/23/5a8f94da4261f.png)

有意思, Association 的原型果然是这个, 格式化用的是 Mathematica 的格式化, 因为按照浮点运算

```js
> Math.log(1000) / Math.LN10 
< 2.9999999999999996
```

文档里还有个运行 py 脚本的例子, 但是只能以字符串返回...那有什么意思...

## 点评

这玩意儿现在几乎没啥用, 这种功能 RunProcess + json + Interpreter 就能搞定

何况现在有了 WolframScript 我为什么不写 bash 脚本呢?

什么时候能交换绘制的图片啊, 函数啊, 神经网络啊什么的才牛逼了.

不过这个应该可以用来实现类似 Jupyter 的功能...

Notebook 左边这个小加号是能扩展的, 未来加个 Python 语言输入, Julia 语言输入也不是不可以啊...

![](https://i.loli.net/2018/02/23/5a8f94da42687.png)

---

Update

一语成谶了啊, Mathematica 真的加入了 Python Cell 和 JavaScript Cell!