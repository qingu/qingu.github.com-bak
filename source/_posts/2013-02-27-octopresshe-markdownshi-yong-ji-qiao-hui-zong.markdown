---
layout: post
title: "Octopress和Markdown使用技巧汇总"
date: 2013-02-27 21:18
comments: true
categories: 
---


### 0. 摘要 ###
本文用于持续收集Octopress使用技巧及高级配置，同时记录在折腾过程中的遇到的问题。

<!-- more -->

### 1. Octopress中在新标签页打开超链接
用markdown写的文档，只支持在本窗口打开超链接，影响阅读效果。参考[李顺利][1]介绍的方法，有两种:

(1). 利用markdown支持html语法，直接使用 `<a href="http://you-need-ref-link.com" target="_blank">my blog</a>` 。

(2). 更好的方法是在{YOUR_OCTOPRESS}\source_includes\custom\head.html文件后面添加下面的代码 (YOUR_OCTOPRESS是你Octopress的主目录)

	function addBlankTargetForLinks () {
      $('a[href^="http"]').each(function(){
      $(this).attr('target', '_blank');
      });
    }

	$(document).bind('DOMNodeInserted', function(event) {
      addBlankTargetForLinks();
	});

[1]: http://www.blogjava.net/lishunli/archive/2013/01/20/394478.html "李顺利"

### 2. 首页只显示摘要部分 ###
* 在markdown文档中加入 `<!-- more -->` 控制摘要截取位置
* 修改 `_config.yml` 中 `excerpt_link` 控制连接文字

### 3.
