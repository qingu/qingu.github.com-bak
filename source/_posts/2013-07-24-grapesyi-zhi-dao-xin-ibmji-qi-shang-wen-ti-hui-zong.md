---
layout: post
title: "GRAPES移植到新IBM机器上问题 汇总"
date: 2013-07-24 18:56
comments: true
categories:
---
本文用于记录将GRAPES移植到中国气象局新IBM机器上遇到的问题总结。
 
<!--more-->

1.问题：编译错误 `ld: 0711-317 ERROR: Undefined symbol: .__netcdf_NMOD_nf90_open`
   
  解决：从错误提示中可以看出问题出在链接ld时没有找到模块netcdf中nf90_open子程序。可是我在编译脚本中
   已经正确的写上了系统自带的NetCDF路径了。然后我用`nc-config`命令查了下版本号是4.1.3的。
   在用这个命令查看Fortran程序链接库形式：

```
    $ nc-config --flibs
```
  
   输出：

```
    -L/path/to/netcdf-4.1.3/lib -lnetcdff -lnetcdf
```
 
   而老版本4.0.1Fortran链接库形式是： `-L/path/to/netcdf/lib -lnetcdf`，少了`-lnetcdff`这个选项。
   所以在configure.grapes.AIX配置脚本中链接库选项加上该选项，编译成功。

2.问题：预编译出现问题，#ifdef指令不识别
   
  解决：将预编译器 /usr/bin/cpp换成 /lib/cpp ，/lib/cpp 实际上是 /usr/ccs/lib/cpp软链接，命令说明信息[见此][1]。
   两者之间具体区别还不清楚。

3.问题： 编译错误：`"Makefile", line 1: make: 1254-055 Dependency line needs colon or double colon operator.“`
   
  解决：问题出在Makefile格式问题，但在其它系统上编译没问题，说明是新IBM系统原因。检查发现编译过程调用IBM默认自带的make，
    但其对格式要求非常严格，为了易用性和可移植性考虑，使用GNU make，在AIX系统下为gmake。
 
 
 
[1]:   http://pic.dhe.ibm.com/infocenter/aix/v6r1/index.jsp?topic=%2Fcom.ibm.aix.cmds%2Fdoc%2Faixcmds1%2Fcpp.htm  "见此"
