---
layout: post
title: "大型机使用技巧汇总"
date: 2013-03-03 21:17
comments: true
categories: 
---
### 0. 前言 ###
因为转模式的缘故，需要和大型机打交道，目前在IBM的AIX系统和神威的Linux系统之间来回倒腾，经常使用大型机如果掌握一些使用技巧，工作效率定会大大提高。本文用于持续总结使用大型机的一些技巧，与大家分享。

<!-- more -->

### 1. 登录 ###
Windows系统下可以用一些ssh登录软件登录大型机，如 `Xmanager` 、`SecureCRT` 等。

Linux系统下直接用终端 + ssh命令。

```
	ssh user_name@host_name
```

host_name一般是大型机IP地址。稍后会提示输入密码，注意输入的密码不可见。

但是这样每次登录都要输入命令和密码，挺烦人的。可以考虑写个脚本自动登录，这里用到工具 `expect` 。
确定自己系统里是否有 expect ：`which expect`。如果没有就装下。

脚本内容：

```
	#!/usr/bin/expect -f

	set user user_name
	set host host_name
	set password my_password
	set timeout -1

	spawn ssh  $user@$host
	expect {
		"*yes/no" { send "yes\r"; exp_continue}
		"*password:" { send "$password\r" }
	}
	interact
```	

将上面代码保存为 go ，设置脚本权限为 755， `chmod 755 go` 。以后直接执行脚本就行。

scp 替代 ftp 传文件：
	scp [option] user@host1:file1 user@host2:file2

示例：

  * 复制本地文件到远程大型机上

	scp localfile user_name@host_name:/home/mydirctory

  * 复制远程大型机上文件到本地

    scp user_name@host_name:~/.bashrc ~

注：传输目录时加选项 `-r`     

### 2. 设置登录路径 ###
这个设置不一定所有人需要。我是因为用的老师的大型机账号，在里面建了个自己的目录，我的所有工作就是在这个目录里完成。
每次登录到大型机后，要 cd 很长的路径才能到达我的工作目录。为了减少工作量，可以利用 `*nix` 系统的自定义函数功能。

```
	cdgu() {
		cd /path/to/my_working_directory
		ls
	}
```

在 Linxu 系统 `~/.bashrc` 或 AIX 系统 `~/.profile` 添加类似以上的代码，保存后 `source ~/.bashrc` 或 `source ~/.profile` 使得修改立即生效。然后在终端里输入函数名 `cdgu` ，看看是不是直接进入自己的工作目录了。

注意起的函数名不要和系统已有命令冲突，可以事先用 `which 函数名` 测试。

### 3. Shell快捷健 ###
首先确定你的登录shell是哪种，用命令 `echo $SHELL` 查看。记住多少个快捷键为宜呢，个人认为 `Less is More` ，够用就好。

BASH Shell快捷键可以参考 [LinuxTOY][1] 和 [维基百科][2]这篇文章总结的。我将第一篇文章网页保存为pdf版本了，可以打印出来放在电脑旁边，没事看看。地址：[百度云盘下载][3] 。

AIX下默认ksh，功能没有bash强大。不过也有一些快捷键。

以下列出一些快捷键，bash 和 ksh 都可以使用（亲测可用）。

  * Ctrl + a ：移到命令行首
  * Ctrl + e ：移到命令行尾
  * Ctrl + f ：按字符前移（右向）
  * Ctrl + b ：按字符后移（左向）
  * Ctrl + u ：从光标处删除至命令行首 （ksh中表现为删除整行）
  * Ctrl + k ：从光标处删除至命令行尾
  * Ctrl + w ：从光标处删除至字首 （ksh表现为从光标处删除至命令行首）
  * Ctrl + d ：删除光标处的字符
  * Ctrl + h ：删除光标前的字符
  * Ctrl + p：历史中的上一条命令
  * Ctrl + n：历史中的下一条命令


[1]: http://linuxtoy.org/archives/bash-shortcuts.html "LinuxTOY"
[2]: http://en.wikipedia.org/wiki/Bash_(Unix_shell)#Keyboard_shortcuts "维基百科"
[3]: http://pan.baidu.com/share/link?shareid=431631&uk=1392639653 "百度云盘下载"

### 4. 常用命令 ###
以下列出一些常用命令：

  * cd ~ : 回到home目录
  * cd - : 回到上一次工作目录（相当于撤销上一次cd命令）
  * ls -l : 列出当前目录下所有文件详细属性（不包含隐藏文件，需要的话加 -a)
  * ll : 'ls -l --color=tty'的别名（快捷方式），目录和链接带色彩，以示区别
  * chmod a+x file : 设置文件权限为所有人可执行（u-用户，g-所属组，o-其他人,a-所有人| r-读权限，w-写权限，x-可执行权限）
  * grep : 文件搜索

### 5. 编译问题 ###
  * AIX系统的xlf90编译器默认不能编译后缀名为 .f90的程序（真扯），需要加上编译选项 `-qsuffix=f=f90` 。如果经常编译f90程序的话，可考虑在 ~/.kshrc 中加上 
  
```    
    alias xx='xlf90 -qsuffix'
```