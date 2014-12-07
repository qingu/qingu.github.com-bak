---
layout: post
title: "shell编程学习笔记：变量篇"
date: 2014-11-17 18:30
comments: true
categories: [shell]
---

## Shell简介

Shell作为一种“胶水”语言，主要目的是将系统中各种工具粘合在一起，其
主要功能是方便的调用各种系统命令。为了这一目的，shell被设计成“面向
字符串”的语言，即**一切皆字符串**。（这有点像Unix设计哲学：一切皆文件）

<!--more-->

刚接触shell编程时，我以为shell脚本只是用来将各种系统命令放在一起顺序执行。
随着学习的深入，才发现shell实际上是一门编程语言。编程语言具有的特点它都有。
如果按照C语言的眼光来看，shell编程语言的学习可以分为两部分：

 * shell语法

  变量、逻辑判断与循环流程控制、函数等语法要素齐全。

 * Unix系统命令

  系统命令可以看作C语言中的标准库，让用户能够更便捷的完成任务。

但需要注意的是，C是编译型语言，而shell是解释型语言。

## 变量

Shell主要是字符串处理语言，当然它也提供一些简单的算术预算功能（功能比较弱）。
不同于编译型语言（如C、Fortran），shell是脚本型语言，不需要变量类型声明。
直接`var=value`这样变量名赋值，变量类型为字符串。也可以通过一些方法声明为数组。

### 变量声明与引用

Shell变量名称的开头是一个字母或下划线符号，后面接任意长度字母、数字或下划线（与C语言
定义类似）。变量名称的字符长度没有限制。**shell变量用来保存字符串值。**

以下是Bash的保留字（或称关键字），变量声明时应避免使用它们。

```
    ! case  coproc  do done elif else esac fi for function if in select then until while { } time [[ ]]
```

#### 变量赋值

```
    var=value
```

变量名称紧接着`=`字符，最后是新值，中间完全没有任何空格。

变量值可以是空值，即不含任何字符，`myvar=    `，**未定义的变量会展开为`null`空字符串。**

如果变量值内含空格，需要加上引号（注意单引号与双引号的区别）

```
    var1=abc
    var2=5        #即使是数字，仍以字符串形式存储在变量中
    var3=This_is_a_long_string
    var4="This_is_a_long_string"      #虽然var4被字符串包围，其值与var3一致
    var5="This is a long string with space"  #由于字符串中有空格，必须加引号
    var6=4+5  #看似一个数学表达式，但以字符串形式存储在变量中
```

#### 变量引用

变量的引用有两种方式：
 
 * 在变量前加上`$`字符，表示引用这个变量的值。 `var7=$var1`
 * 使用`${}`包围变量，如`var8=${var2}`

### 符号常量

使用`readonly`命令使变量称为只读模式，而之后赋值给它们是被禁止的。

```
    hours_per_day=24
    readonly hours_per_day
    #也可以合并为一句（需要POSIX兼容）
    readonly hours_per_day=24
```

### 环境变量

环境是一个名称与值得简单列表，可供所有执行中的程序使用。新的进程会从其父进程
继承环境，也可以在建立新的子进程之前修改它。

`export`命令可以将新变量添加到环境变量中去。

```
    PATH=$PATH:/usr/local/bin
    export PATH
    #或写成一句（须POSIX兼容）
    export PATH=$PATH:/usr/local/bin
```

注意变量赋值放在某一命令名称与参数前，该变量只对当前命令有效，对后面的命令不会有效。

```
    #!/bin/bash

    function cmd1(){
	echo local_var is $var
    }

    var=a
    var=b cmd1 
    echo org_var is $var

    #输出结果为：
    local_var is b
    org_var is a

```

`export`命令仅将变量加到环境中，如果需要从程序的环境中删除变量，则要用`env`命令，
`env`也可以临时改变环境变量值。

```
    env -i PATH=$PATH HOME=$HOME awk '...' file1
```

-i 选项是用来初始化环境变量的，也就是丢弃任何的继承值，仅传递命令行上指定的变量
给程序使用。

`unset`命令从执行中的shell中删除变量或函数。缺省时，会解除变量设置，加上`-v`选项
可特指解除变量。`-f`选项删除函数。

```
    unset var1   #or
    unset -v var1
    unset -f function_name
```

### 小结

 * shell是针对字符串处理的一门编程语言。
 * 通过`var=value`直接赋值给变量，使用`$`或`${}`引用变量值。
 * `readonly`声明变量为只读类型，`export`命令声明变量为环境变量，`unset`命令删除变量或函数。
    

## 参考文献

[1] Bash脚本编程语言中的美学与哲学 <http://www.cnblogs.com/youxia/p/linux010.html>

[2] `man bash`

[3] Arnold Robbins, Nelson H.F. Beebe. Shell脚本学习指南

