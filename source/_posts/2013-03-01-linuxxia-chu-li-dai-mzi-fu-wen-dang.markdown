---
layout: post
title: "Linux下处理带^M字符文档"
date: 2013-03-01 20:55
comments: true
categories: [Linux, vim]
---

### 原因 ###
`*nix` 系统下用vim打开在Windows下编辑的文档会发现每行后出现 `^M` 字符，这是因为DOS下的编辑器和Linux编辑器对文件行末的回车符处理不一致。在windows下换行符是 `\r\n` ，而 `*nix` 下换行符是 `\n` 。以下是几种解决方法。

<!-- more -->

### 解决方法 ###

1.使用 Linux 内置命令行工具 `dos2unix`

    dos2unix filename

   具体用法可以 `man dos2unix`

注：AIX系统下命令是 `dosunix` ，语法是：

    dosunix inputfile outfile

2.Vim中替换命令

在命令模式下输入 `%s/^M//g` 。其中 `^M` 是用 `Ctrl+v` 和 `Ctrl+m` 输入的。

3.Vim中 `set` 命令(测试不成功)

在命令行模式下输入

	:set fileformat=unix
	:w

4.`sed` 工具

第2种方法中替换思路可以用sed实现，具体命令为：

    sed 's/^M//g' filename > new_filename

注意其中 `^M` 就是原来的 `^` 和 `M` 组合。与方法2有区别。

5.`*nix` 内置tr命令（测试不成功）

原因分析里说过Windows换行符比*nix多了 `\r` 。使用内置转换字符命令 `tr` 。

	tr -d '\r' filename

以上就是我从网上收集的几种方法，其中方法3和方法5测试未成功，可能是我用错了，知道的人可以告诉我，先行谢过！
