---
layout: post
title: "Octopress和Markdown使用技巧汇总"
date: 2013-02-27 21:18
comments: true
categories: 
---


### 0. 摘要 ###
本文用于持续收集Octopress使用技巧及高级配置，同时记录在折腾过程中的遇到的问题。

1. Octopress中在新标签页打开超链接

2. 首页只显示摘要部分

3. About分页创建

4. 在Octopress中使用 $latex$
<!-- more -->

### 1. Octopress中在新标签页打开超链接 ###
用markdown写的文档，只支持在本窗口打开超链接，影响阅读效果。参考[李顺利][1]介绍的方法，有两种:

(1). 利用markdown支持html语法，直接使用 `<a href="http://you-need-ref-link.com" target="_blank">my blog</a>` 。

(2). 更好的方法是在{YOUR_OCTOPRESS}/source/_includes/custom/head.html文件后面添加下面的代码 (YOUR_OCTOPRESS是你Octopress的主目录)

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

### 3. About分页创建 ###
* 在 `{Octopress_home}/source` 目录下新建 `about` 目录，并在里面创建 `index.markdown` 文件。

* 编辑导航页 `{Octopress_home}/source/_includes/custom/navigation.html` ，添加以下内容 :

     `<li><a href="{{ root_url }}/about/index.markdown">About</a></li>`

* 侧边栏添加 `about me` 介绍:在 `{Octopress_home}/source/_includes/custom/asides/about.html` 添加 About me 信息

```html
    <section>
       <h1>About me</h1>
       <p><img src="/images/about.jpg"></p>
       <p>say something about yourself</p>
       <p><a href="mailto:youremail@gmail.com"><img src="/images/my_mail.png" alt="youremail@gmail.com"></a></p>
    </section>
```

* 效果请见我的about me。

### 4. 在Octopress中使用 $latex$ ###
参考[雁起平沙博客][2]介绍方法，使用 `kramdown` 渲染markdown文档，支持 $latex$ 。

注意还有一步是将 `_config.yml` 中修改 `markdown: kramdown`

右键点击公式网页消失问题解决方法[见此][3]

示例：


	$$
	\begin{align*}
	  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
	  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
	  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
	      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
	      \vdots & \ddots & \vdots \\
	      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
	    \end{array} \right)
	  \left( \begin{array}{c}
	      y_1 \\
	      \vdots \\
	      y_n
	    \end{array} \right)
	\end{align*}
	$$

公式效果图：


$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$

[2]: http://yanping.me/cn/blog/2012/03/10/octopress-with-latex/ "雁起平沙博客"

[3]: http://steshaw.org/blog/2012/02/09/hello-mathjax/ "见此"

