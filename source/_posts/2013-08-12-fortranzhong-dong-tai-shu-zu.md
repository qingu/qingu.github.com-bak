---
layout: post
title: "Fortran中动态数组"
date: 2013-08-12 15:28
comments: true
categories: [Fortran]
---

###动态数组###

Fortran90中有三种动态数组。这三种动态数组允许在运行时创建，数组大小由计算或输
入得到的值决定。三种动态数组是：

* 自动数组(automatic arrays)

* 可分配数组(allocatable arrays)

* 指针数组(pointer arrays)

<!--more-->

####自动数组####

自动数组是函数或子程序的局部数组，其大小取决于哑元相关的值。自动数组在程序入口处自动创
建（分配）并且在程序出口处自动销毁。自动数组大小一般在不同程序调用时不一样。

自动数组例子：

```
	RECURSIVE SUBROUTINE F( N )
	INTEGER :: N
	REAL :: X ( N )     ! an automatic array
	REAL :: Y ( 1000 )  ! an explicit-shape local array on the stack 
```   

```
	function F18(A,N)
	integer  N                     ! A scalar
	 real A(:,:)                   ! An assumed shape array
	 real F18(size(A,1)  )         ! The function result itself is
								   !  an automatic array.

	 complex  Local_1(N,2*N+3)     ! Local_1 is an automatic array
								   !  whose size is based on N.

	real Local_2(size(A,1),size(A,2))     ! Local_2 is an automatic array
                                   !  exactly the same size as A.

	real Local_3(4*size(A,2))      ! Local_3 is a one-dimensional 
                                   !  array 4 times the size of 
                                 ! the second dimension of A.
	 ...                           !  
	end function F18
```

注意声明自动数组中像SIZE这样的内置查询函数。Fortran90提供许多允许出现在声明中
的查询函数。数组边界、大小，字符类型长度及kind类型都可以用含有这些查询函数的表
达式说明。一个说明表达式是一个标量整型表达式，操作数的值在进入程序时确定。这样
的操作数包括常量、内置程序的引用和通过哑元、模块、common和主程序可访问的变量。

####可分配数组####

可分配数组是那些显式声明ALLOCATABLE的数组。一个可分配数组可以是一个程序局部变
量，也可以放在模块变量中，对模块中所有程序来说是全局的。一个可分配数组使用
ALLOCATAE语句显式分配，用DEALLOCATE语句显式销毁或当其为未指定SAVE属性的局部数
组时，退出程序时自动销毁。一个全局可分配数组一直存在直到显式销毁（deallocate语
句可能与allocate语句不在同一个程序中）。如果数组大小取决于一个计算的值，而不是
哑元或模块变量、common或主程序，使用可分配数组。可用ALLOCATED内置函数测试一个
可分配数组的分配状态。

可分配数组例子：

```
	subroutine Peach
	use Recipe                    ! Accesses global allocatable array, Jam.

	 real, allocable :: Pie(:,:)   ! Pie is a 2-dimensional allocatable array.
	...
	 allocate ( Pie(N,2*N )   )    ! Allocate a local allocatable array.
	
	 if (.not.allocated(Jam)) allocate ( Jam(4*M) )
	                               ! Allocate a global allocable array if
	                               ! it is not already allocated.
	 ... deallocate ( Pie )
	 ...
	end subroutine Peach

	module Recipe                  ! Jam is a global allocatable array, and
	 real, allocable :: Jam(:)     ! can be allocated and deallocated in
	 ...                           ! any procedure(s) using this module.
	end module Recipe
```

注意可分配数组的声明边界为冒号，表明这些在后面提供。这使可分配数组声明看起来像
假设大小（assumed-shape）哑元声明，这是因为维数大小的“推迟”特征类似的。

####指针数组####

指针数组类似于可分配数组，他们用ALLOCATE语句显式分配，拥有任意计算大小并且用
DEALLOCATE语句显式销毁。


####数组在内存中存储位置####

数组的存储方式不完全是Fortran语言所决定的，还与编译器有关。但是常见的默认
情况是allocatable array放在堆里（heap），automatic array放在栈里（stack）。
一般编译器的栈的大小都设置得不大，容易出现栈的空间不够的情况，在Visual Fortran
里提示stack overflow，在f77这样的unix平台下的编译器里通常是core dump，
这时把栈的大小改大就能解决问题，改的方法就依编译器而定了。








参考文章：

1.[http://www.phy.ornl.gov/csep/pl/node17.html][1]

2.[http://www.newsmth.net/bbsanc.php?path=%2Fgroups%2Fsci.faq%2FNumComp%2Ffor%2FFortran%2FM.1091071527.E0][2]



[1]: http://www.phy.ornl.gov/csep/pl/node17.html "http://www.phy.ornl.gov/csep/pl/node17.html"

[2]: http://www.newsmth.net/bbsanc.php?path=%2Fgroups%2Fsci.faq%2FNumComp%2Ffor%2FFortran%2FM.1091071527.E0 "http://www.newsmth.net/bbsanc.php?path=%2Fgroups%2Fsci.faq%2FNumComp%2Ffor%2FFortran%2FM.1091071527.E0"
