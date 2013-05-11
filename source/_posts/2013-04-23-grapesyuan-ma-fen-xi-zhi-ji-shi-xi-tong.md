---
layout: post
title: "GRAPES源码分析之计时系统"
date: 2013-04-23 16:14
comments: true
categories: [GRAPES, Fortran, MPI]
---
### 前言 ###

模式开发者（尤其是并行计算开发者）对模式各部分执行花费的时间很感兴趣，需要了解哪里耗时比较长，进而对其进行优化。普通用户一般不需要这个功能。计时系统的一般思路：在需要计时部分的起点和终点设置计时器（调用计时子程序），两个点时间差即为计时部分所耗时间。

<!--more-->

### GRAPES计时系统 ###

目前发现GRAPES中有3套计时系统，分别在 `module_integrate` 、 `sovle_grapes` 及 `ritche_puw_jin` 中，对各自调用的子程序进行计时。计时子程序使用MPI墙钟函数。为了使版本统一，使用条件预编译方法控制开启实现计时功能（MPI同步计时会使模式整体运行时间过长，不适用于业务）。

#### solve_grapes计时系统 ####

以下以solve_grapes中计时系统进行说明

* 计时开始部分（别忘了引入mpi模块， `use MPI` ）

```
	#ifdef DETAIL_TIMING
	   integer :: ierr, comm
	   real*8 :: start_time, end_time
	   real*8 ,save::  wtimer(80,2)=0. 
	   !保存计时数据的二维数组，第一维指不同计时部分，第二维指不同步和同步两种情况
	#endif

	#ifdef DETAIL_TIMING
	   comm=mpi_comm_world          
	   call mpi_barrier(comm, ierr)  !各进程同步，使各进程计时起点一致
	   start_time=mpi_wtime()        !记录起点墙钟时间
	   call get_communicator(comm)
	#endif
```

* 第一个计时部分终点处

```
	#ifdef DETAIL_TIMING
	     end_time=mpi_wtime()             ！本进程计时终点墙钟时间
	     wtimer(1,1)=end_time-start_time  ! 未同步情况本进程该计时部分所用时间
	     call mpi_barrier(comm, ierr)     ! 同步
	     end_time=mpi_wtime()             ！所有进程都执行完该部分时墙钟时间
	     wtimer(1,2)=end_time-start_time  ！同步情况下执行时间
	     start_time=end_time              ! 下一计时部分的起点墙钟时间
	#endif
```

* 以后每一计时部分计时思路与上述相同

* 在 `solve_grapes` 最后输出每步积分步各调用部分执行时间

```
	#ifdef DETAIL_TIMING
	     write(73,*) 'step',step,':'
	     write(73,*) "no_barrier for timing *************"
	     write(73,'(10F8.4)') (wtimer(i,1),i=1,80)
	     write(73,*) "barrier for timing *************"
	     write(73,'(10F8.4)') (wtimer(i,2),i=1,80)
	#endif
```
文件号为73的文件是在 `module_integrate` 中定义的。

```
   write(filename,'(A7, I5.5)') 'Timing.',myprcid  !各进程计时输出文件名，
   open (73,file=filename,form='formatted')        !有多少进程，就有多少文件
```

#### 其它 ####

`module_integrate` 中计时系统与 `solve_grapes` 中一样，只不过计时都为非同步情况下的时间，保留在 `wtimer_integrate` 一维数组中。预编译条件与 `solve_grapes` 相同，都为 `DETAIL_TIMING` 。

**注：每一积分步 `solve_grapes` 执行时间保留在 `wtimer_integrate(5)` 中.**

还有一套是在 `module_semi_lag` 中 `ritche_puw_jin` 中定义的，预编译条件为 `SL_TIMING` 。

如果需要开启计时系统，需在 `configure.grpaes` 中预处理器选项 `ARCHFLAGS` 中加上类似 `-D predefineName` ，如 `-DSL_TIMING` 。
