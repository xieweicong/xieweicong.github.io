---
date: '2025-01-05T15:51:56+09:00'
draft: false
title: '关于Ruby二三事'
tags: [ruby]
---

## 开篇

我成为一名 Ruby on Rails 开发已经一年的时间了，但对于 Ruby 我还是知之甚少，甚至从某种意义上来说我并不是很想深入了解。也许是一种并不好的执念，我在日本，我觉得 Ruby 只有日本在使用，而随着 Python 的发展，Rails 也可以被 Django 所代替。而其他的快速的 api 开发也完全被 flask 或者 FastAPI 所替代，使用 Python 也可以快速地在这个 AI 时代将自己开发的 AI 程序接入互联网。我也不是很清楚为什么 mac 的一些命令行工具，比如`brew`是使用 Ruby 开发，但我相信未来这样的东西也会越来越少。那为什么我还要写这一系列文章呢？

事情的起因大约是我自己在使用 AI 生成一个很长的代码后，我想对代码进行更好的架构与重构。在这之中我看了一些资料，学到了关于 Python 的一些面向对象开发的知识。主要是读了这一系列文章[one-python-craftsmanzh_CN12-write-solid-python-codes-part-1.md at master · pigleione-python-craftsman](https://github.com/piglei/one-python-craftsman/blob/master/zh_CN/12-write-solid-python-codes-part-1.md)，也使用微信阅读找到了这位作者出的书，[Python工匠](https://book.douban.com/subject/35723705/)。我才第一次读到了面向非新手的编程书籍，也由此读到了很多以前忽略的 Python 细节。于是我才开始思考，我所使用的工作语言 Ruby 是否也有类似的面向中级 Ruby 开发者的书籍呢？才找到了[研鑽Rubyプログラミング 実践的なコードのための原則とトレードオフ](https://www.amazon.co.jp/%E7%A0%94%E9%91%BDRuby%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0-%E5%AE%9F%E8%B7%B5%E7%9A%84%E3%81%AA%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AE%E5%8E%9F%E5%89%87%E3%81%A8%E3%83%88%E3%83%AC%E3%83%BC%E3%83%89%E3%82%AA%E3%83%95-Jeremy-Evans/dp/4908686173?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&crid=2PF18EJ6EDNH&dib=eyJ2IjoiMSJ9.2LfTLqfglMz6c1N_gAH2KB26gj_Vl7FLidUaeWY9fQk_3ApMeMM9u5WrEJSevDExkOGilu0QgknZtsnsyrP05K8ekD1zKdZMkFf-pXRdMjiPqaeM6V-O9-HbFfAad8Qlfzqt_7ExygRnyuEp5GvAM6C8S-xT1mOpQLyIlUImAXYktpprVuqyHlI6sktXVjCShnHxvii0oLFlHC2PBUuFHZZSKMGNcuZlnHAzWaBiMrPkOYSM39it-LxRWX0sHMoABgaK1t8Ytg1G8eRNqspAzPb812sOEZjSe3sh212vGoB92lBSIxBX5qw2x_Ioy9VtXJdZ9VHUVvSLPZVf5TX9WWQZpWhenvZ77nmuoSX--ZsVV9q__W7nUPakdpNGo-Wd9WT4bJGbkoP6WhpVACti7RQNl46ONId_GoGNbqMKMkdU3nxDAK6ZAjkht85oLmfr.7RtlI8mjnc22Rd_hYtKOao4THwC1zgFdTtBHRY4iPkg&dib_tag=se&keywords=ruby&qid=1736082204&sprefix=ruby%2Caps%2C310&sr=8-9)这本书。

二十几条设计原则的出现是在 90 年代，那时候面向对象编程也才刚刚开始，我读[Python工匠](https://book.douban.com/subject/35723705/)时才知道原来那些我以前听说过的，膜拜的原则在更现代的编程语言下并不能完全适用，要结合本身语言的特性做一些修改。所以我就想到，与其使用 Python 来学习，为什么我不直接使用 Ruby 来学习呢？其实学习到的知识，越深入，越容易进行迁移。用 Ruby 学习，我也可以因为工作而动手实践。虽然我并不是那么喜欢 Ruby，但我似乎都没有给它一个认真面对的机会呢。于是有了接下来我会写的一系列文章，我会分享我读这一本书的一些感受与笔记，也许有机会还会扩充出去其他的一些关于 Ruby 的知识。
