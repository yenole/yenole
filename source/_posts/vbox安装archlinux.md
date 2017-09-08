---
title: vbox安装archlinux
date: 2017-09-08 10:00:45
tags: ['linux','archlinx','vbox']
categories: "linux"
---

## 下载archlinx镜像
 * [中科大镜像](http://mirrors.ustc.edu.cn/archlinux/iso/)
 * [阿里云镜像](http://mirrors.aliyun.com/archlinux/iso/)

## vbox新建虚拟机
 * 类型【Linix】
 * 版本【Arch Linux（64bit）】
 * 启动选中下载的archlinux镜像
 * 选择【Boot Arch Linux (x86_64)】

## 安装步骤
 * 查看磁盘信息和新建分区
 * 挂在磁盘到/mnt
 * 修改pacman国内源
 	* 源配置文件:/etc/pacman.d/mirrorlist
 	* 中科大镜像:http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
 	* 阿里云镜像:http://mirrors.aliyun.com/archlinux/$repo/os/$arch
 * 安装系统
 	>pacstrap /mnt/ base base-devel net-tools
 
