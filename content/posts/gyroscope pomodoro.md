---
title: "Gyroscope Pomodoro"
date: 2021-03-11T15:41:46+08:00
draft: true
toc: false
images:
tags: 
  - Ios
---

This is a simple tomato clock app based on using the function of gyroscope to monitor the usage situation of the phone. Currently only the mvp development is completed.

ジャイロスコープの機能を利用して、携帯電話の使用状況を監視することを基本とした、シンプルなトマト時計アプリです。現在はmvpの開発のみ完了しています。

这是一个简单地关于利用陀螺仪监控手机情况的番茄钟软件，目前只完成了mvp开发。

# HOW TO USE

First of all, enter the start screen, set up the countdown, start the countdown and the current position of the phone will be recorded.

まず、スタート画面に入り、カウントダウンを設定し、カウントダウンを開始すると、携帯電話の現在位置が記録されます。

首先进入开始界面，设定倒计时的时长，开始倒计时的同时，App会记录当前手机的位置。

{{< figure src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0jv1ahq4dj20n01dsgmj.jpg" title="start" width="200" >}}

The phone will monitor the rotation in three directions as image, and if it exceeds a certain value then the user will be considered as he/she has picked up the phone.

携帯電話は3方向の回転を監視し、それがある値を超えた場合、ユーザーは携帯電話を動かしたとみなされます。

手机会如图监测三个方向的旋转，如果超过一定数值则判断使用者拿起手机。

{{< figure src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0jv1l31a8j20u00u00uo.jpg" title="gyroscope" width="400" >}}

Once the user picks up the phone(or makes the position of the phone change), the countdown will be paused and there will be "DON'T MOVE" message appeared on the screen.

ユーザーが携帯電話を手に取る（または携帯電話の位置を変える）と、カウントダウンは一時停止し、画面に「DON'T MOVE」のメッセージが表示されます。

如果使用者被判断为拿起了手机或者改变了手机的位置，倒计时会自动停止并在屏幕上显示“不要动”的信息。

{{< figure src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0jv1tegvkj20n01dsmy6.jpg" title="don't_move" width="200" >}}

When a countdown is completed, it will tell the user that you have completed and show the number of completions with a dot at the bottom of "Today".

カウントダウンが完了すると、完了したことをユーザーに伝え、"Today "の下部にドットで完了数を表示します。

当完成一个倒计时后，会告诉使用者你已完成一次倒地时，并在下方today处用“点”的图样显示完成次数。

{{< figure src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0jv21wg0wj20n01dswfh.jpg" title="you_made_it" width="200" >}}
