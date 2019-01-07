---
title: Gayhub 加V认证
date: GMT[{2017, 11, 11, 19, 02, 35}, 8]
tags:
  - github
  - tutorial
  - BiGrid
categories:
  - GALASTER’S DIMENSION
---

任何社交网站都有大V, 那全球最大的同性交友网站自然也有咯.

大V当然要有独特的标记, Gayhub的标记是什么样的呢?

![](https://i.loli.net/2018/03/07/5a9fab23d67a8.png)

<!--more-->

## Warning!!!

首先警告一下这个东西超级麻烦, 以后每次提交都要输入 commit 密码

这还没完, 而且如果你使用 IDE 麻烦会平方.

另外这个无法补签... 你全绿漏一天你明年再接再厉吧...

Rebase 之后还丢失认证, 除非使用专用的变基技巧...

如果你确定你不怕麻烦就是要加V的话那我们开始吧!

### 应用场景

使用这个东西的原因就是 github 并不强制验证提交

你可以非法获取关注, 填上大佬的邮箱, 然后commit就会被计入大佬的动态里(feed流), 大佬莫名奇妙就被提交了

还有, 如果你以贵司CTO身份提交一段bug代码那就好玩了...

大佬为了表明这是亲自提zhuang交bi才会用这个

所以某种意义上确实是 Github 大V 认证 

## 使用gpg签名

### 产生key

`gpg --gen-key`, git 安装自带这个模块.

然后他会问你一大堆的问题:

```
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection?
```

你想要那种key?`(4)`
 
当然是签名专用的咯, DSA,RSA其实都差不多, 当然有ECC就更好了.

```
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
```

你想要多长? `(4096)`

废话当然越长越好啊...

```
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0)
```

Key 的有效期? `(0)`

永久(我认为), 时限确实是个问题, key生成后不能改也不能随便换, 删掉可能会把以前的认证某些情况下会掉.

然后输入自己的github的用户名和联系邮箱, 可以带一条 commit.

```
GalAster
galaster@foxmail.com
From 2018-2-22-18:24
```

然后需要一个 commit 密码, 输入是看不见的, 要输两遍防止输错

**以后每次commit都要输入这个密码!**

### 启用key

到这里就完成了, 接下来查看你的key列表:

`gpg --list-keys`

```sh
/.gnupg/pubring.gpg
---------------------------------
pub   4096R/9E91A3EF 2018-02-22
uid                  GalAster (From 2018-2-22-18:24) <galaster@foxmail.com>
```

这里的 9E91A3EF 就是 key 的编号, 接下来导出秘钥

`gpg --armor --export pub 9E91A3EF`

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-----END PGP PUBLIC KEY BLOCK-----
```

把以上部分输入github即可: [Github-GPG](https://github.com/settings/gpg/new)

接下来强制启用commit签名

```sh
git config --global commit.gpgsign true
git config --global user.signingkey 9E91A3EF
git config --global alias.commit commit -S
```

如果某个项目不要签名, 那就单独取消

```sh
git config commit.gpgsign false
```

## IDE 配置

Well, 如果你使用IDE就超麻烦了, 如果你使用 Win 那就 $$\small{麻烦×2, 麻烦^2, 麻烦^{麻烦^{麻烦^\cdots}}}$$ 了...

我看了好多 Linux 的教程, 外加一个 Mac 唯独没有 win 的...

看了两个小时原理才摸索出一个方法来...

### Win 用户

我把这个问题里的一大串过程看了一遍

[Stackoverflow: GPG in Intellij](https://stackoverflow.com/questions/46863981/how-to-sign-git-commits-from-within-an-ide-like-intellij)

首先需要把 `tty` 关掉, 输入`echo 'no-tty' >> ~/.gnupg/gpg.conf`.

tty 大概就是终端(teletypewriter)模式的意思, IDE里的那叫Termial乃至Console, 和tty不是一回事, 我本来也没弄明白, 绕了半天.

其次需要一个 `gpg-agent` 来代替 `tty`, 这个可以由某种加密软件来充当, 这我只知道putty自带的那个可以, 然后捣鼓了半天还是拎不清由谁来代理加密. 

唉, 看看有没有别的软件... 

我又搜了搜 gpg+win 找到一个 [Gpg4win](https://gpg4win.org/get-gpg4win.html) 这名字... 那就它了!

下载速度很慢...天生慢, 因为挂代理都没用...

毕竟win用户从来没有加密需求>>逃

安装, 然后git指向这个可执行文件(shell下要转义, powershell下就算了)

```
git config --global gpg.program "C:\\Program Files (x86)\\GnuPG\\bin\\gpg.exe"
```

还没完, 打开那个 Kleopatra 软件, 导入你的秘钥.

然后你可以去你的 IDE 里点 push 了, 每次commit都要输密码了.

如果你还是有问题, 那么可以手动更改全局设定

![](https://i.loli.net/2018/03/07/5a9fae742cce1.png)

### Linux 用户

虽然 Linux 动手能力很强, 但是这个还是不太好找的

解决方案: [Jetbrains: GPG in Linux](https://youtrack.jetbrains.com/oauth?state=%2Fissue%2FIDEA-127802)

`git config --global gpg.program /usr/local/bin/gpg`

然后新建一个bash脚本放在 `/usr/local/bin/gpg`

```sh
#!/bin/bash
/usr/bin/gpg --batch --no-tty "$@"
```

### Mac 用户

本来对 Mac 用户要收费的, 但我干掉了这个难题心情不错, 附赠的...

解决方案: [Stackoverflow: GPG on Mac](https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0)

```sh
brew install pinentry-mac
echo "no-tty" >> ~/.gnupg/gpg.conf
echo $(which pinentry-mac) >> ~/.gnupg/gpg-agent.conf
```