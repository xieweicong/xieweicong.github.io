---
title: "使用hugo和github Pages搭建个人博客"
date: 2021-12-10T16:51:06+08:00
draft: true
toc: false
images:
tags: 
  - hugo
  - github pages
---

尝试过hexo，但因为看到hugo的模板更好看所以选择使用hugo。而且hugo是使用go语言开发，之后考虑学习golan和后端，所以先使用一下这个框架去感受一下。

## 安装Homebrew

``` shell
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 安装hugo

```shell
$ brew install hugo
```

检测安装成功

```shell
$ hugo version
```

## 创建网站文件

```shell
$ hugo new site [sitename]
$ cd [sitename]
```

## 添加主题

在 https://themes.gohugo.io 中找到自己想要的主题，进入对应 github 准备 clone 下来。这里使用 hermit 举例子。

```shell
$ cd sitename/themes
$ git clone https://github.com/Track3/hermit.git
```

![截屏2021-12-10 下午5.16.51.png](https://s2.loli.net/2021/12/10/uYsPJmQy3KNwDvM.png)

进入 clone 下来的文件夹，可以看到这个主题的文件。其中 exampleSite 是官网中的示例文件，打开来。

![截屏2021-12-10 下午5.17.25.png](https://s2.loli.net/2021/12/10/QiIoOSp86w5TXLz.png)
