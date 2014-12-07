---
layout: post
title: "source命令与./区别"
date: 2014-11-07 09:37
comments: true
categories: [shell]
---

bash执行脚本的方式有以下几种：

<!--more-->
 
 * `source script.sh`
 * `bash script.sh`
 * `./script.sh`    #脚本中首行应该是`#!/usr/bin/env bash`

那么使用`source`命令和其他两种方式有什么区别呢？可以使用
下面的例子看出它们的区别。

现有一个脚本`cmd.sh`，其内容如下：

```
    # cmd.sh
    function cmd1()
    {
        echo "hello from cmd1"
    }
```

按照以下几种方式执行，看输出结果的区别。

```
    $ ./cmd.sh
    $ cmd1
    cmd1：未找到命令
   
    $ bash cmd.sh
    $ cmd1
    cmd1：未找到命令

    $ source cmd.sh
    $ cmd1
    hello from cmd1
```

可以看出两者区别是：
 * `source`命令是在当前进程中执行脚本文件中的各个命令，而不是另起
一个子进程（subshell）。
 * 其它两种方式则是另起一个子进程。

这就涉及到变量在哪些环境中生效，环境变量的作用等话题，以后再说。
