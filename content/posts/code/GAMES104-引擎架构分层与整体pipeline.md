---
title: "GAMES104 引擎架构分层与整体pipeline"
date: 2022-03-23T22:42:44+08:00
draft: false
toc: false
images:
tags: [GAMES, GAMES104, Game-Engine]
---

## A Glance of Game Engine Layers

1. Tool Layer 工具层
2. Function Layer 功能层
3. Ressource Layer 资源层
4. Core Layer 核心层
5. Platform Layer 平台层

​    +3rd Party Libraries

![截屏2022-03-24 上午11.05.54](https://tva1.sinaimg.cn/large/e6c9d24egy1h0ksmjmbroj20d00bodgp.jpg)

## Resource - How to Access My Data

将数据Importing，变成资产

## Function - How to Make the World Alive

### Tick

> 世界按照普兰克时间的间隔来tick

![截屏2022-03-24 上午12.28.47](https://tva1.sinaimg.cn/large/e6c9d24egy1h0ka7dpwwzj20eg0c8wet.jpg)

### Function - Dive into Ticks

1. tickLogic - 每一次tick的逻辑

2. tickRender - 每一次tick的渲染

   ![截屏2022-03-24 上午11.05.38](https://tva1.sinaimg.cn/large/e6c9d24egy1h0ksmc6vngj21m30u0q7k.jpg)

![截屏2022-03-24 上午1.21.23](https://tva1.sinaimg.cn/large/e6c9d24egy1h0kbq2ulzbj20uy0he0vt.jpg)

从多核设计底层代码，比如一个核心做tickLogic一个核心做tickRender

## Core Layer

1. Math Library
2. Data Structre and Containers
3. Memory Management

![截屏2022-03-24 上午1.27.07](https://tva1.sinaimg.cn/large/e6c9d24egy1h0kcxt1ae9j20a40bqglw.jpg)

游戏引擎和操作系统很类似，会单独申请一块内存，自我进行管理，为了最高效率。

### **提高内存管理速度**

1. 尽可能放到一起
2. 尽可能按照顺序
3. 尽可能一起读写

## Platform - Target on Different Platform

不同的平台会调用不同的api去编程

## Tool - Allow Anyone to Create Game

![截屏2022-03-24 上午1.46.09](https://tva1.sinaimg.cn/large/e6c9d24egy1h0kcfr8191j20v20fsad3.jpg)

## Why Layered Architecture?

复杂度太高，需要通过封装管理（封装：原子构成篮球，我们研究操作篮球）

可以动上层，少动下层

每一步要思考我做的是哪一层

## Mini Engine - Pilot

![截屏2022-03-24 上午1.56.25](https://tva1.sinaimg.cn/large/e6c9d24egy1h0kcqf5wupj20nm0ds3zj.jpg)

## Takeaways

- 引擎是分层架构
- 越底层越稳定，越上层越灵活
- 游戏引擎最核心靠tick函数
