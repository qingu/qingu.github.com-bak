---
layout: post
title: "MPI性能分析库-libmpitrace"
date: 2013-11-02 18:58
comments: true
categories: 
---
**前言**

MPI性能分析库libmpitrace可用来分析程序中MPI函数调用所花时间并能跟踪MPI函数调
用情况。工作原理是程序链接libmpitrace库时，该库将拦截程序中MPI调用，使用封装了性
能分析功能的MPI函数，从而获得性能分析和跟踪信息。该库同时提供一组函数接口用于
定制收集、跟踪数据的方式。注意该库只能用在单线程应用或MPI函数只用一个线程执行
的应用中。

<!--more-->

**编译链接libmpitrace**

* 编译时需要加上`-g`选项

 * 加`-g`编译选项可保证获得映射回程序源代码的性能信息

 * 可能要关掉或降低应用优化等级（-O2,-O1,...）

 * 高级优化会影响调试信息的准确性，并影响调用堆栈行为

* 链接库选项加上`-L/path/to/libmpitrace -lmpitrace`

 * -lmpitrace必须加在 -lmpich之前，从而保证调用的MPI函数是封装过的MPI函数

**性能分析数据输出**

加上以上选项后，编译好后正常运行程序，会生成`mpi_profile.rank`文件（
rank为进程号）。可以看下mpi_profile.0文件里内容（#后为我添加的说明,原数据并不
存在这些内容）：

```
#数据来自哪个进程
Data for MPI rank 0 of 1024:
#数据统计区域，无额外控制时默认为 MPI_Init()和MPI_Finalize()之间代码区域
Times and statistics from MPI_Init() to MPI_Finalize().
#各个MPI函数调用次数，平均传输数据量bytes以及所花时间统计
-----------------------------------------------------------------
MPI Routine                  #calls     avg. bytes      time(sec)
-----------------------------------------------------------------
MPI_Send                        144         7448.0          0.002
MPI_Recv                        144         7448.0          0.018
MPI_Sendrecv                    432         8157.3          0.102
MPI_Allreduce                   285           31.7          0.520
-----------------------------------------------------------------
#总的通信时间、代码区域总的墙钟时间、用户cpu时间、系统时间、最大内存使用
total communication time = 0.642 seconds.
total elapsed time       = 1.397 seconds.
user cpu time            = 1.137 seconds.
system time              = 0.000 seconds.
maximum memory size      = 1423168 KBytes.

-----------------------------------------------------------------
Message size distributions:

MPI_Send                  #calls    avg. bytes      time(sec)
                             144        7448.0          0.002

MPI_Recv                  #calls    avg. bytes      time(sec)
                             144        7448.0          0.018

MPI_Sendrecv              #calls    avg. bytes      time(sec)
                             144        3192.0          0.004
                             144        6384.0          0.036
                             144       14896.0          0.061

MPI_Allreduce             #calls    avg. bytes      time(sec)
                               1           8.0          0.001
                             158          16.0          0.303
                              32          28.0          0.048
                              64          52.0          0.117
                              30          76.0          0.051

-----------------------------------------------------------------
#通信最少、中间、最大时间以及来自哪个进程
Communication summary for all tasks:
  
  minimum communication time = 0.105 sec for task 52
  median  communication time = 0.592 sec for task 940
  maximum communication time = 0.804 sec for task 25

#根据通信时间对所有进程排序
MPI tasks sorted by communication time:
taskid      comm(s)  elapsed(s)     user(s)     size(KB)   switches
    52        0.11        1.40        0.70       478620           3
    41        0.11        1.40        0.70       477644          10
    59        0.11        1.40        0.70       477064           8
    46        0.11        1.40        0.69       477040           9
...
```


默认输出所有进程的MPI通信情况（这一点和我看到的资料情况不太相同，资料上都说
缺省只输出4个文件）。可以通过设置环境变量`SAVE_ALL_TASKS=no`为0和MPI
通信时间最少、最多、中间值四个文件（如果进程0通信时间最少、最多、中间值，则为
三个文件）。


**控制需要性能分析的代码区域**

如果不额外设置，默认收集MPI_Init()和MPI_Finalize()之间的计时数据。可以从
mpi_profile.rank中第二行数据看出来`Times and statistics from
MPI_Init() to MPI_Finalize().`

如果关注指定代码区的MPI通信情况，可以在指定代码区前后插入`summary_start()`和
`summary_stop()`子程序。

```
call summary_start()
call do_work()
call summary_stop()
```

可以从生成的mpi_profile.rank中看到统计区域变成
`Times and statistics from summary_start() to summary_stop().`

**`summary_start()`和`summary_stop()`调用可用在循环结构中，得到的数据是指定代
码区数据的总和**


GRAPES中需要统计某一积分步内MPI通信情况，可以用以下代码：

```
if(step == n)then
  call summary_start()
endif
call model_subroutine()
if(step == n)then
  call summary_stop()
endif
```

**结束语**

关于libmpitrace库中跟踪（trace）功能还不太懂，感觉是通过生成的trace数据中地址回溯到
源代码行，目前不需要该功能，以后再说吧。

**参考文章**

1. [http://publib.boulder.ibm.com/infocenter/clresctr/vxrx/index.jsp?topic=%2Fcom.ibm.cluster.pedev.v1r2.pedev100.doc%2Fbl7ug_compilelinklibmpitrace.htm](http://publib.boulder.ibm.com/infocenter/clresctr/vxrx/index.jsp?topic=%2Fcom.ibm.cluster.pedev.v1r2.pedev100.doc%2Fbl7ug_compilelinklibmpitrace.htm)

2. Bob Walkup,Internal Use MPI Wrappers for BGQ.

