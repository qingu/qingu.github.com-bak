---
layout: post
title: "vim学习笔记:分割窗口"
date: 2013-11-17 14:33
comments: true
categories: [vim]
---
###用途###
* 同时显示两个以上不同文件
* 同时查看同一个文件的两个不同位置
* 同步显示两个文件的不同之处

<!--more-->

###命令###

```
	:split
```

vim中使用以上命令将当前窗口分为上、下两个窗口，光标定位在上面窗口中，显示内容为
同一文件。

切换窗口

```
	Ctrl-W w  或
	Ctrl-W w Ctrl-W w
```

关闭当前窗口(:q,ZZ命令容易将所有窗口关闭)

```
	:close
```

关闭除当前窗口之外的所有其他窗口(该命令成功执行前提是其他窗口修改已保存)

```
	:only
```

---

为另一文件分割出一个窗口

```
	:split anotherfile  
```

打开一个新窗口并编辑一个空的缓冲区

```
	:new
```

---

设置窗口大小

  * `:3split anotherfile` 打开一个高度为3行的新窗口
  * `Ctrl-W +/-`

```
	Ctrl-W + 增加当前窗口高度
	Ctrl-W - 减少
	4 Ctrl-W + 增加4行高度
	｛height} Ctrl-W _ 指定height高度的窗口（下划线）
```

  * 鼠标拖动状态栏

---

垂直分割窗口

```
	:vsplit
	:vnew
```

---

切换窗口

以上`Ctrl-W W`命令只能按照一定顺序往下切换窗口，对于既有水平切割、垂直切割的复杂窗口
该命令就不怎么高效了。可以使用Ctrl-W 配合hjkl键实现左下上右窗口切换：

```
	Ctrl-W h  切换到左边窗口
	Ctrl-W j  切换到下边窗口
	Ctrl-W k  切换到上边窗口
	Ctrl-W l  切换到右边窗口
	Ctrl-W t  切换到顶部窗口
	Ctrl-W b  切换到底部窗口
```

---

移动窗口

```
	Ctrl-W H
	Ctrl-W J
	Ctrl-W K
	Ctrl-W L
```

---

针对所有窗口命令

```
	:qall(!)
	:wall
	:wqall
```

---

每一个文件打开一个窗口

* 命令行上vim

```
	vim -o one.txt two.txt ... (上下分割窗口)
	vim -O one.txt two.txt ... (垂直分割窗口)
```

* vim中

```
	:all 为命令行指定的所有文件各打开一个窗口
	:vertical all 垂直分割
```

---

使用vimdiff查看不同

```
	vimdiff a1 a2
```

其中折叠栏开关方式：

* 鼠标点击
* 命令`zo 折叠`、`zc 折起`

vim中可以使用

```
	:e a2
	:vertical diffsplit a2
```

同步滚动默认开启，可以使用`:set noscrollbind`关闭

跳到不同之处

```
	]c 直接向前定位到下一个不同之处
	[c 向后定义下一个发生改变行
```
	
