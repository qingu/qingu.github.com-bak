---
layout: post
title: "Segmentation fault根本原因"
date: 2013-05-31 19:55
comments: true
published: false
categories: [Segmetation fault,Fortran,Linux]
---

## 前言 ##
本文译自Intel® Developer Zone上文章[Determining Root Cause of Segmentation
Faults SIGSEGV or SIGBUS errors][1]。

<!--more-->

## 正文 ##
**问题**：当我运行由Intel Fortran编译器编译的代码时，在Linux平台得到'sigsegv'
错误提示(或Mac OS X平台sigbus提示)。这份代码在<先去编译器/平台>上运行多年没出
问题。这是Intel编译器一个bug吗？

**运行环境**：linux 或 Mac OS X

**根本原因**：有许多可能原因。段错误(segmentation fault)(Mac OS X下是bus
        error)是一个有多种原因的通用错误。下面我们描述潜在的原因并给出建议以避
免段错误。

**可能原因 #1 Fortran指定栈空间耗尽：解决方法 -heap-arrays编译选项**

Intel Fortran编译器使用栈空间分配许多数组数据的临时或中间副本。

**非OpenMP和非自动并行应用**：如果你的程序未使用OpenMP或
Auto-parallelization(-parallel编译开关)且编译器版本是Linux v9.1.037(或所有Mac
        OS 编译器)，那么可以尝试 `-heap-arrays` 编译选项。OpenMP或
Auto-parallelization用户如用低于v9.1.0137的Linux
编译器请阅读**可能原因 #2**关于不限制栈大小的提示。

```
	-heap-arrays
```

如果这个解决了sigsegv或bus error错误的话，可以不用往下读了。你可能想读pdf附件
学习关于临时数组何时何处被创建内容。改变一点代码可以避免一些临时数组，从而减少
对临时副本的需求(改善性能)。同时，`-heap-arrays`编译器选项有一个可选参数[size]
来指定大于[size]的数组分配到堆(heap)中的阈值大小，单位为Kbytes，其它小于等于[size]的
分配到堆栈中。例如：

```
	-heap-arrays 10
```

将所有大于10Kbytes的自动和临时数组放入堆中。

**可能原因 #2 堆栈空间耗尽。 解决方法：增加OpenMP应用或其它应用的堆栈大小**

首先尝试*增加*Linux和Mac OS X的shell堆栈限制。然而，该选项可能对OpenMP或自动并行
代码的数据共享产生无法预料的影响。因此，建议OpenMP和自动并行用户不用
`-heap-arrays`，转而尝试*关掉*shell堆栈大小的限制。


Linux, bash: `ulimit -s unlimited`

Linux, csh/tcsh: `unlimit stacksize`

你可以用以下方法检查你的堆栈大小限制，并找到你的shell环境的`stack size`限制。

bash: `ulimit -a`

csh: `limit`

注意：如果你在一个批处理子系统下运行程序，可能需要将上面命令加入到个人启动配置
文件中(~/.bashrc、~/.profile或~/.cshrc)

对于Mac OS X系统，shell堆栈大小有一个硬上限。对于大多系统，

bash: `ulimit -s 65532`

即设置堆栈限制为64MB。


一个可替代方法是使用一个链接选项增加执行者默认shell堆栈大小，方法记录在此：[/en-us/articles/intel-fortran-compiler-increased-stack-usage-of-80-or-higher-compilers-causes-segmentation-fault][2]

重新运行你的程序，如果这个方法解决此问题了，可以不用往下读了。如果你的应用仍然
产生sigsegv或bus error，继续读吧。

**可能原因 #2 主要的：由于堆或通用内存耗尽导致堆栈耗尽**

在进程内存映射中，堆和堆栈相互向对方增长。如果他们碰撞了，这也能引起一个关于堆分配或下一个堆栈分配的段错误。

也可能应用耗尽所有物理内存+swap缓冲区。记住，对于64位应用，虚拟内存实际上是
unlimited。然而，事实上可消费的内存大小有一个上限，物理ram+swap空间（典型的是
物理内存大小的2倍）。可以通过 `free` 命令获得该信息。物理内存也可以通过`cat
/proc/meminfo`中'MemTotal'项和'SwapTotal'项看到。系统本身也需要一些空间，所以
经验法则是尽可能保持应用的内存占用(memory footprint)在MemTotal的80%左右并且不要超过
MemTotal+SwapTotal。

使用`-g -traceback`编译链接来定位代码终止的地方。

**可能原因 #3 由于用户代码错误导致堆栈溢出**

有许多用户代码错误可能引起堆栈溢出并导致运行时sigsegv或bus error。由于段错误可
能发生在与堆栈最初溢出地方不相关的程序后面部分，从而导致错误很难发现。

第一步尝试隔离代码错误发生的地方。通过产生一个执行’traceback’来得到。使用ifort
驱动和下面这些选项编译、链接：

```
	-g -traceback
```

当代码出错，通常会得到关于错误发生时的调用堆栈的报告。如果没有得到一个堆栈
traceback，确保在编译和链接时都用到了`-g`并且确保编译时使用了`-traceback`。有
这样的情况：当程序在内核空间时段错误发生，因此没有用户堆栈用于trace back。
Intel正致力于在未来版本中改善这点。

trace back报告从下往上读。找到最上面的子程序或函数并通过行号来隔离出哪条指令引
起错误的。检查这条语句的用户代码错误。如果没有明显用户错误，继续往下。

**可能原因 #4 数组越界. 解决方法：-check bounds**

`-check bounds`编译选项提供数组访问和字符串表达式运行时检查保证索引在数组边界
内。这个检查有助于找到索引超出数组申明大小的情况。这个选项对性能影响很大，影响
程度取决于应用中多少数组访问被执行。同时，`-check bounds`数组越界检查不对最外
维指定为*的虚参数组或上下维都为1的数组执行。为开启边界检查，用下面选项编译：

```
	-check bounds -g
```

并运行程序。检查在运行时执行，而不是在编译时执行。如果这样能发现错误，停下来。
没有，继续往下读。

**可能原因 #5 把函数当作子程序调用(calling)或把子程序当作函数调用(invoking)**

当用户做类似于这样的事，用户代码错误：

```
--- main program ---
...
call ThisIsIllegal( some_arguments )
...
--- end main program ---

--- ThisIsIllegal ---
integer function ThisIsIllegal( some_arguments )
...
--- end ThisIsIllegal ---
```

上面例子中，主程序以子程序调用方式调用ThisIsIllegal，然而ThisIsIllegal申明是函
数。这会引起堆栈溢出。为测试这些情况，尝试使用编译选项

```
	-fp-stack-check -g -traceback
```

用这些选项编译并运行。如果堆栈由于类似上面的原因崩溃，代码将推出并给出一个
stack trace。

可以用一个编译时检查来检查程序接口：

```
	-gen-interfaces -warn interfaces
```

编译时检查将为你的程序产生INTERFACE块。`-warn`接口随后将使用这些编译器产生的接口并
检查程序调用确保参数和接口在被调用者和调用者之间匹配。注意这个检查只对Fortran
源代码起作用。对混编程序不检查接口。

**可能原因 #6 传递非连续数组部分引起的大的临时数组. 解决方法：使用 -check
arg_temp_created 侦测并通过包含显式接口和assumed shaped 数组代码修复**

考虑这个例子：

```
--- main program ---
real(8) :: f(1800,3600,1)
external sub
...
call sub( f(1:900,:,:) )
...
--- end main program ---
```

子程序‘sub’在单独的编译源文件中：

```
--- external subroutine "sub" ---
subroutine sub( f )
real(8) :: f(900,3600,1)
...
--- end subroutine "sub" ---

```

这种情况下，‘sub’期望一个连续数组，大小为900*3600*1。然而，调用传递一个内存中
非连续的数组。这种情况下，编译器将在调用时产生一个临时数组复制数组"f"非连续块
元素使之成为连续数组，这这是”sub“所期待的。除非指定
`-heap-arrays`，否则这个临时数组分配在堆栈中。

为了检测代码里是否发生这样的情况，用下面选项编译：

```
	-check arg_temp_created
```

并运行程序。当临时参数被创建，将输出信息。为了解决这个问题，创建一个显式接口，
并在”sub“使用一个assumed shaped数组将移除临时数组的需要。

```
--- main ---
real(8) :: f(1800,3600,1)
interface
subroutine sub(f)
real(8) :: f(:,:,:)
end subroutine sub
end interface
...
call sub( f(1:900,:,:) )
...
--- end main program ---

--- "sub" ---
subroutine sub( f )
real(8) :: f(:,:,:)
...
end subroutine sub

```

记住，虽然这样避免了临时数组，编译器知道"sub"内数组"f"可能是非连续的。因此，一
些使用"f"的语句的优化可能关闭，进而影响性能。

**不属于以上情况：解决方法-进一步深入分析**

99%的sigsegv或bus error错误原因是上面列举的情况。然而，也有其他可能情况导致段
错误。

如果你的应用链接外部库，确保库和编译器兼容。外部库是否用Intel编译器编译的？如
果是，是否主要版本一致-即库用Intel Fortran v9.1编译的，但你的应用用Intel
Fortran v10.x或v11.x编译的？ Intel只保证主版本内兼容(9,10,11就是主版本例子)

如果外部库来自于软件销售商或工具：该销售商是否明确Intel编译器兼容，如果确认，
他们用哪个版本验证他们的库？你应该只是用销售商验证过的Intel编译器版本。

**当所有都失败了...**

提交给用户论坛吧！




[1]: http://software.intel.com/en-us/articles/determining-root-cause-of-sigsegv-or-sigbus-errors "Determining Root Cause of Segmentation Faults SIGSEGV or SIGBUS errors"

[2]: http://software.intel.com/en-us/articles/intel-fortran-compiler-increased-stack-usage-of-80-or-higher-compilers-causes-segmentation-fault "/en-us/articles/intel-fortran-compiler-increased-stack-usage-of-80-or-higher-compilers-causes-segmentation-fault"

