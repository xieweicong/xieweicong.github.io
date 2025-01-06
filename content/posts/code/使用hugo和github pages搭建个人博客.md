---
title: "使用hugo和github Pages搭建个人博客"
date: 2021-12-10T16:51:06+08:00
draft: false
toc: false
images:
tags: [hugo, github pages]
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

## 添加文章

```shell
$ hugo new posts/my-first-post.md
```

这样会在 `contant/posts` 下添加第一篇文章

## 添加主题

在 https://themes.gohugo.io 中找到自己想要的主题，进入对应 github 准备 clone 下来。这里使用 hermit 举例子。

不过建议直接下载解压主题再拖进去，如果直接clone，对主题进行修改，会出现一些问题。

```shell
$ cd [sitename]/themes
$ git clone https://github.com/Track3/hermit.git
```

![截屏2021-12-10 下午5.16.51.png](https://s2.loli.net/2021/12/10/uYsPJmQy3KNwDvM.png)

进入 clone 下来的文件夹，可以看到这个主题的文件。其中 exampleSite 是官网中的示例文件，将`config.toml` 文件的内容复制到根目录同名文件中。

![截屏2021-12-10 下午5.17.25.png](https://s2.loli.net/2021/12/10/QiIoOSp86w5TXLz.png)

之后使用 `$ hugo server -d` 实时预览效果吧！



## GitHub Pages的准备

创建名为`[username].github.io` 的仓库

![截屏2022-03-19 上午1.06.59](https://tva1.sinaimg.cn/large/e6c9d24egy1h0ej9814mbj21hz0u0dlb.jpg)

GitHub Pages会自动把当前页面的`index.html`显示成网页，可以选择root目录或是docs目录。

这里我们使用docs目录。

## hugo的最后准备及推送

将 `config.toml` 中的 `baseURL = "xxx"` 修改成即将上线的根网址。

```shell
$ hugo -D
$ mv public docs
$ git init
$ git remote add origin 远程地址
$ git add .
$ git commit -m first-post
$ git push origin master
```

这样等几分钟就可以正常访问了。

之后更新如果觉得麻烦可以使用下面的 `.sh`  脚本执行。这里面加入了 `CNAME` 文件可以使用自定义的网址。

```shell
rm -rf docs
hugo -D
mv public docs
cp -R CNAME ./docs/CNAME
git add .
git commit -m new
git push
```

