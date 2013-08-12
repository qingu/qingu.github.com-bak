---
layout: post
title: "Fortran获得文本文件行数方法"
date: 2013-08-12 12:21
comments: true
categories: [Fortran] 
---

**需求的由来**

在读取一个文本文件里的数据时，需要将一列数据赋给一个数组，但是不知道确切的行数
，也就不知道怎么声明该数组大小。只能将其声明为可变大小的（allocatable）数组，
在程序运行时确定了行数值，然后根据行数分配数组大小。

可以利用read命令中设置字段IOSTAT或END来确定文本文件的行数。

`read(UNIT=num, FMT=format, ...,IOSTAT=stat, ..., END=endlabel,...)`

<!--more-->

**方法**

1.设置字段IOSTAT

 IOSTAT=stat 

 在读取文件过程中，会返回一个整数值给stat变量，用来说明文件的读状态，其中：

 stat>0  表示读取操作发生错误

 stat=0  表示读取操作正常

 stat<0  表示文件读取结束

 当返回的stat值小于0说明文件读取结束，我们就利用该功能获得文本文件行数。

```
   program get_num_records
   implicit none
   integer :: NR, stat
   character(len=79) :: buffer

   open(15,file='example')

   NR=0
   do while(.true.)
	 read(unit=15,fmt="(A79)",iostat=stat) buffer
	 if(stat==0) then
	   NR = NR + 1
	 else if(stat>0) then
	   write(*,*) 'Something is wrong with READING operation'
	 else
	   exit
	 endif
   enddo

   close(15)
	
	write(*,*) 'The number of Lines is', NR

   end
```

2.设置字段END

 END=endlabel 

 读到文件末尾时，跳到行代码endlabel处继续执行

 主要程序代码为：

```
    ...
	NR=0
	do while(.true.)
	  read(unit=15,fmt="(A79)",end=100) buffer
	  NR = NR + 1
	enddo

	100 print *, NR
    ...
```



