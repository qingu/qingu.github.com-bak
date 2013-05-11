---
layout: post
title: "GRAPES源码分析之namelist"
date: 2013-04-02 20:18
comments: true
categories: GRAPES,Fortran 
---

### 前言 ###

在GRAPES、WRF等模式中常见到类似 namelist.input 或 .nml 文件。文件里放入一些如预报区域范围、预报时间，技术方案选择及运行模式所需进程数等控制模式运行的配置变量。实际上 namelist 是 Fortran 中一种特殊的I/O读写格式。本文首先介绍 namelist 语法及如何读写，然后介绍 GRAPES 模式中是如何应用 namelist 的。

<!-- more -->

### namelist 语法 ###

namelist 把一组相关变量封装在一起，输入/出这一组变量时，只要在 write/read中的nml字段赋值要使用哪一个namelist就行。

#### namelist 文件格式 ####

namelist文件格式：

```
	&nml_name1      ! &接某一组namelist名字
	var1 = value,   ! 输出变量名称，等号，值及逗号
	var2 = value,   
	...
    /               ! 除号结束这一组namelist
    
    ...

    &nml_nameN      ! 第n组namelist
    ...
    /
```

#### namelist 声明 ####

namelist声明类似common语法，但nml一定要取名字，必须在执行语句前声明。首先对各个变量进行声明，然后声明各组namelist。在输入/出namelist前，必须先声明namelist。如下：

```
	integer :: var1           !先对每个变量如平常一样声明
	real    :: var2

	namelist /nml_name1/ var1,var2   !然后声明那些变量属于哪个namelist组
```

#### namelist 输出 ####

```
	write(unit, nml=nml_name)     ! nml_name指每组namelist的名字
```

在write的nml字段中指定输出哪个namelist，就把nml中变量全部输出。输出的namelist不能规定输出格式。每个数值内容使用什么格式来输出，由编译器决定。

#### namelist 输入 ####

```
	read(unit, nml=nml_name)
```

如果从键盘读入namelist，必须按照一定的格式输入，如下所示：

```
	&nml_name1 var1=1 var2=2.0 /    !以&开始，紧接namelist名字，
                                  	!然后以var=value输入每个变量,以 / 结束
```

读取namelist时，可以不填入所有变量的值，只要以 &nml_name 开始输入，给一个除号就可以结束输入。变量可以不按照顺序输入，程序会自动按照变量名称来设置数值，变量甚至可以重复输入，不过变量会得到最后一次设置的值。

namelist通常使用文本文件进行读写，nml文件常以 .nml 后缀标示其文件属性 (这个不一定，Linux系统不以后缀名确定文件类型，但用 .nml 结尾可以很方便识别文件属性)。

nml 使用read从文件中读取数据时，会自动从 **目前的位置**向下寻找存放namelist的地方。

### GRAPES中的namelist ###

GRAPES中有好几个namelist ： RUN/namelist,input, RUN/rrtmg.nml, RUN/colm.nml(这个是 SRC/physics/CoLM/build.colm.nml 的软链接) 。

#### namelist.input ####

主要查看namelist.input，其他两个类似

该文件保存了模式的一些配置信息（都是标量），配置变量在 shared/module_configure模块中声明。

该模块中子程序 initial_config 用于读入namelist.input变量。步骤：

 * 声明子程序临时配置变量，然后把一组组相关变量封装在各组namelist中。

 * 打开namelist.input文件

```
 	OPEN ( UNIT   = 10               ,      &
             FILE   = "namelist.input" ,      &
             FORM   = "FORMATTED"      ,      &
             STATUS = "OLD"            ,      &
             IOSTAT = io_status         )
```


 * 临时配置变量先赋一个初值，即默认值。以防namelist中没有这个变量，保证变量都有值。

 * 输入/出namelist，代码如下

```
 	REWIND  ( UNIT = nml_unit )
    READ  ( UNIT = nml_unit , NML = namelist_01 , ERR = 9200 , END = 9200 )
    WRITE ( UNIT = *                  , NML = namelist_01 )
    ...
    重复以上三句输入/出下一组namelist
```

 rewind表示回到文件nml_unit 的开始，在用rewind之前必须保证该文件已打开（即之前有open操作且成功了）。

 read语句从文件开头开始查找nml字段为namelist_name的相关变量，err字段用来设置当前文件打开错误时，程序跳跃到label所指的代码处继续执行。end指在读写到文件末尾时，转移到某个行代码来继续执行程序。这里都是到9200处。

 write语句向标准输出写入namelist，GRAPES中已重定向到 std.out.**** 文件。

 * 然后向所有进程广播临时配置变量

```
 	call grapes_bcast( s_we                       ,1 )
 	...    
```

 * 最后将临时配置变量赋给对应的派生数据类型 config_flags (该派生数据类型是在本模块中声明的),关闭文件，结束namelist输入。

```
 	config_flags % s_we                       =  s_we 
 	...

 	CLOSE ( UNIT = 10 , IOSTAT = io_status )
```

 * 另：配置变量通过 shared/module_domain模块中cpconfig子程序赋给状态变量 grid 。


### 总结 ###

由以上分析可得出添加GRAPES配置变量的一般流程：

 * 在namelist.input中按照nml格式添加变量，并给出其值

 * 在shared/module_configure模块中grid_config_rec_type声明中添加相应变量

 * 并在子程序 initial_config 声明临时配置变量，赋初值，读入，广播，赋给配置变量

 