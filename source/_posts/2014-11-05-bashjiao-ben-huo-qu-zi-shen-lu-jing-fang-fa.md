---
layout: post
title: "Bash脚本获取自身路径方法"
date: 2014-11-05 20:20
comments: true
categories: [shell]
---

恢复博客的更新^-^

<!--more-->

Shell中有一个命令叫`pwd`可以获得当前工作目录。如果脚本在脚本
所在目录下执行，使用`pwd`命令可以得到脚本的当前目录。

```
    # /home/user/scripts/getmydir.sh
    MYDIR=`pwd`
    echo $MYDIR
```

在/home/user/scripts目录下执行`./getmydir.sh`得到脚本所在的绝对路径。

但如果该脚本在其他目录下执行，比如在`/home/user`下执行`scripts/getmydir.sh`
得到的路径却是`/home/user/`。

---

可以看出`pwd`命令获取脚本自身路径有一定限制。我们可以用以下方法在任意目录
执行该脚本获取其绝对路径：

```
   # /home/user/scripts/getmydir2.sh
    MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

将以上这条长命令分解来看就是：

```
    DIR1="{BASH_SOURCE[0]}"   #脚本相对于当前目录的路径，是相对路径
    DIR2="$( dirname $DIR1 )"   #得到脚本的目录名，也是相对路径
    #cd命令切换到脚本所在目录，再执行pwd命令得到脚本绝对路径
    MYDIR="$( cd $DIR2 && pwd )" 
```

该脚本能成功的关键是`BASH_SOURCE`环境变量。当用`.`或`source`执行脚本时，
`BASH_SOURCE`变量会自动设置到源文件路径。

---

还有一种方法是使用`readlink`命令达到效果。

```
    DIR1="`dirname $BASH_SOURCE`"
    MYDIR=`readlink -f "$DIR1"`
```
   
