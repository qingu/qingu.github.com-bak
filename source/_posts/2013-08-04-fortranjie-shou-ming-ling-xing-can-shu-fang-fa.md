---
layout: post
title: "Fortran接收命令行参数方法"
date: 2013-08-04 08:53
comments: true
categories: [Fortran]
---
在实际编程中常遇到下面一种情况：每次执行程序前需要修改程序中某些参数变量，再编
译、执行；然后再修改参数变量... ，如此显得麻烦。如果需要修改的参数很多，可以考
虑使用namelist设置变量。但是只有一两个参数需要修改的话，可以考虑Fortran中获取
命令行参数的方法。

<!--more-->

Fortran主要通过以下两种内置子程序实现获取命令行参数目的。

**1.GET_COMMAND_ARGUMENT(number, value, length, status)**

 功能：获取命令行传递的第 `number` 个参数
 
 标准：Fortran 2003以上
 
 语法：GET_COMMAND_ARGUMENT(number [, value, length, status])
 
 参数：

  number -- intent(in)，整型标量，且 >=0
 
  value  -- intent(out),可选参数，字符类型标量
  
  length -- intent(out),可选参数，整型标量
  
  status -- intent(out),可选参数，整型标量

 返回值：

  调用 GET_COMMAND_ARGUMENT 子程序， value参数保留第nubmer个命令行参数。如果
  value不能容纳这个参数，参数被截断以适应value长度。如果命令行上指定参数个数小
  于number参数，value被赋为空白。如果nubmer=0，value值为程序名。length参数包含
  第nubmer个命令行参数的长度。如果参数取回失败，status为一正值；如果value包含
  截断的命令行参数，status为-1，否则status=0

 相关子程序：

 GET_COMMAND : 用于获取整个命令行

 COMMAND_ARGUMENT_COUNT : 获取命令行参数个数

 示例：

```
   PROGRAM test_get_command_argument
            INTEGER :: i
            CHARACTER(len=32) :: arg
          
            i = 0
            DO
              CALL get_command_argument(i, arg)
              IF (LEN_TRIM(arg) == 0) EXIT
          
              WRITE (*,*) TRIM(arg)
              i = i+1
            END DO
          END PROGRAM
```

  运行程序:

```
    $./test_get_command_argument aa 4 3.45

    ./test_get_command_argument
	aa
	4
	3.45
```

**2.GETARG(pos, value)**
 
 功能：取回命令行传递的第pos个参数。该内置程序提供向后兼容GNU Fortran 77。新代
 码里，建议使用Fortran 2003标准提供的GET_COMMAND_ARGUMENT内置子程序。

 语法：GETARG(pos, value)

 参数：

  pos   -- intent(in)，整型标量，pos >= 0

  value -- intent(out)，字符类型

 返回值：

  调用GETARG子程序，value参数保留第pos个命令行参数。如果value不能容纳不下参数
  ，截断该参数适应value长度。如果命令行指定的参数小于pos，value赋为空。如果
  pos=0，value值为程序名。

 相关子程序：

 IARGC : 获取命令行参数个数
 
 示例：

```
      PROGRAM test_getarg
            INTEGER :: i
            CHARACTER(len=32) :: arg
          
            DO i = 1, iargc()
              CALL getarg(i, arg)
              WRITE (*,*) arg
            END DO
          END PROGRAM
```


---

**数据类型转换**

通过上面介绍的两个子程序可以获得命令行参数，但我们也注意到子程序返回的命令行参
数为字符类型，如果我需要获得其他类型（如整型、实型）的参数怎么办？

我们可以利用Fortran内部文件实现数据类型转换。

彭国伦建议将内部文件（Internal File）称为“字符串变量文件”，这个叫法比较贴切。
我猜测Fortran中写入文本文件实际经过两个过程：首先将数据转换为字符类型，然后将字符符
号写入文件中。读文件则是先将文件中数据以字符类型读入，然后根据赋给的变量类型进行相应
类型转化。这样看的话，内部文件方法是将字符串变量看成一个“文件”，然后写操作将数据转化为字
符类型，然后“写入”字符串变量这个“文件”中，从而间接实现类型转换。

字符转换数值型，使用 `read(str, *) numeric`;
数值型转换成字符型，使用 `write(str, *) numeric` ,可以使用格式化控制字符串格式
。

以下是用GET_COMMAND_ARGUMENT子程序获得命令行上数值型参数示例。

```
	program get_cmdline_args
	integer :: argINT
	real    :: argREAL
	character(len=10) :: arg1
	character(len=10) :: arg2

	call get_command_argument(1,arg1)
	call get_command_argument(2,arg2)

	read(arg1,*) argINT
	read(arg2,*) argREAL

	argINT = argINT + 1
	argREAL = argREAL + 2.0

	write(*,*) arg1, arg2
	write(*,*) argINT, argREAL

	end
```

运行程序：

``` 
   $ ./get_cmdline_args 2 3.5
   2         3.5       
         3           5.5000000
   
```


参考文章：

[http://gcc.gnu.org/onlinedocs/gfortran/GET_005fCOMMAND_005fARGUMENT.html][1]

[http://gcc.gnu.org/onlinedocs/gfortran/GETARG.html][2]


[1]: http://gcc.gnu.org/onlinedocs/gfortran/GET_005fCOMMAND_005fARGUMENT.html 

[2]: http://gcc.gnu.org/onlinedocs/gfortran/GETARG.html
