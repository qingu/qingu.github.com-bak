---
layout: post
title: "[经验总结]二进制数据不同平台传输一致性问题"
date: 2013-11-04 21:10
comments: true
categories: [Linux,AIX,Fortran]
---
###应用场景###
经常遇到这样一种情况：将二进制数据从windows通过FTP软件传到AIX/Linux系统下，然
后在AIX/Linux系统下用相应程序读取该数据时出现错误。

<!--more-->

###可能原因和解决方法###
如果传输的是平台无关的数据类型，如nc格式或grib格式的数据，可能原因是FTP软件传
输方式问题，传输二进制数据应该使用binary方式，但有可能FTP软件选择了ASCII方式，
从而导致数据传输出错（使用xmanager的Xftp容易出这种问题，推荐FileZila）。我们可以
使用md5sum验证这个可能性。工作原理是MD5码相当于一个文件的“指纹”，同一文件的
MD5码是不变的，但文件被修改后MD5码也就不相同了。我们
只要验证数据文件在windows和linux下MD5码是否相同就可以确定数据是否被修改。

* Linux下使用`md5sum`命令生成文件MD5码

```
$ md5sum filename

a526b653b8820296e074a2a635505a5f
```

运行该命令，会生成一个32个字符的十六进制串。

* windows下可到网上下载验证MD5的软件，如`winMd5Sum`

将两种平台生成MD5码对比下，如果不一致说明传输过程数据改变了。需要将ftp传输方式
改为binary或者换个FTP软件试试。

###另一种原因###
如果传输的是Fortran生成的unformatted数据，还有一种可能原因是不同平
台的数据端序问题，在X86平台下默认生成的是little_endian类型，而IBM的power cpu上
是big_endian类型。


