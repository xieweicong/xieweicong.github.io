---
title: "Docker从布置到上线"
date: 2021-12-16T17:42:17+08:00
draft: false
toc: false
images:
tags: [docker]
---

## 前言

docker技术真的非常好用和方便，但看了很多文章很杂乱，所以整理一个从安装打包到上线的全过程

## 安装doker

macOS最好直接官网下载GUI的版本安装

在linex远程服务器上

```bash
curl -fsSL <https://get.docker.com> | bash -s docker --mirror Aliyun
```

## 修改允许的hosts

在django中需要填入vps的地址或域名

![截屏2021-12-06 上午12.00.39](https://tva1.sinaimg.cn/large/008i3skNgy1gxftfjahojj316w0oan1z.jpg)

## 文件准备

![20190408113307863](https://tva1.sinaimg.cn/large/008i3skNgy1gxftfsckyij30gy0ak74w.jpg)

### **pip.conf**

这个是pip的配置文件，制作完成之后，将这个文件复制到虚拟机对应的pip根目录下，即可完成替换。主要功能是换成阿里云的镜像。在境外的话不需要这个。

```
[global]
index-url = <http://mirrors.aliyun.com/pypi/simple/>
[install]
trusted-host=mirrors.aliyun.com
```

### **requirements.txt**

用下列代码快速导出本机或虚拟环境的所有依赖

```bash
pip freeze > requirements.txt
```

### **Dockerfile**

docker在创建时将会使用这个文件进行构建。比较特殊的是这个文件没有后缀名，所以像Mac就不能直接创建，使用`touch`命令执行生成。

```bash
touch Dockerfile
vim Dockerfile
FROM python:3.9
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY pip.conf /root/.pip/pip.conf
COPY requirements.txt /usr/src/app/
RUN pip install -r /usr/src/app/requirements.txt
RUN rm -rf /usr/src/app
COPY . /usr/src/app
CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8080"]
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"] ##flask用这条，默认到5000端口
```

1. 以官方库python:3.9为基础进行制作，实际是一个装有python3.9的Linux
2. 运行命令创建新文件夹 /usr/src/app
3. 确定工作路径
4. 将本地的pip.conf复制到pip的根中进行替换
5. 将requirements.txt复制到指定目录下
6. 运行命令按照requirements.txt的内容进行pip安装
7. 运行命令删除这个文件夹中的所有内容，-rf是递归强制删除
8. 将整个项目复制到这个文件夹中
9. 执行命令运行docker时，内部Django项目的运行命令，开放8080端口
10. flask用这条，默认到5000端口

## **制作镜像image**

这里就是执行这个Dockerfile文件了，随便给镜像取个名字`my-django-app`，后面的`.`表示当前文件夹，会自动寻找Dockerfile文件并执行。

```bash
docker build -t my-django-app .
```

## **运行容器**

镜像完成我们就可以通过镜像制作容器了。`-d`表示开启守护进程模式将我们的项目后台挂起，`-p`映射端口。前面的是本机的端口，后面的是Docker内部镜像的端口，这边开放的端口由上面Dockerfile文件指定过。

```bash
docker run -d -p 8080:8080 my-django-app
```

## **访问**

直接在浏览器内输入`localhost:8080`，即可查看效果。

## 登录

执行login即可登录，Mac端是已经登录过的，直接运行代码就可以通过验证了，其他端输入DockerID和密码即可完成登录。

```bash
docker login
```

## 修改名称

需要根据你的用户名修改你镜像的名称，比我的用户名为xieweicong95，就需要在镜像前添加xieweicong95。

```bash
docker tag my-django-app xieweicong95/my-django-app
```

如果不修改的话会报错：denied: requested access to the resource is denied。因为默认是推送到library仓库中去的，当然没有权限。

## 推送

直接填写完整的镜像名进行推送。

```bash
docker push xieweicong95/my-django-app
```

## 创建docker组避免重复输入sudo

回到云端，在 Ubuntu 中所有的 docker 命令前面要加 sudo 执行管理员权限，或者

添加docker組：

```
sudo groupadd docker
```

将目前的用户 ”$USER“ 添加到docker组：

```bash
sudo gpasswd -a $USER docker
```

執行`newgrp docker`或注銷/進入以激活對組的更改。

## **拉取**

和前面一样在云端登录docker，连接远程主机，填写完整的镜像名进行直接拉取即可。

```bash
docker pull xieweicong95/my-django-app
```

和本地一样运行

```bash
docker run -d -p 8080:8080 xieweicong95/my-django-app
```

## 服务器修改入站规则

如使用Amazon Lightsail，如下图所示修改出入站规则，开放上面指定的端口

![截屏2021-12-05 上午2.43.52](https://tva1.sinaimg.cn/large/008i3skNgy1gxftfxi7eaj315y0i6mzd.jpg)

## 访问页面

通过 公用ip地址:8080 访问 django 服务
