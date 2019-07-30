---
title: vbox安装archlinux
date: 2017-09-08 10:00:45
tags: 
    - linux
    - vbox
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

### 查看磁盘信息和新建分区

### 挂在磁盘到
 * mount /dev/sdxa /mnt

### 修改源
 * 源配置文件:nano /etc/pacman.d/mirrorlist
 * 中科大镜像:http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
 * 阿里云镜像:http://mirrors.aliyun.com/archlinux/$repo/os/$arch

### 安装系统
 * pacstrap /mnt/ base base-devel net-tools

### 配置fstab
 * genfstab -U /mnt/ >> /mnt/etc/fstab

### 配置系统
 * arch-chroot /mnt

### 生成locale
 * nano /etc/locale.gen
 * locale-gen
 * echo 'LANG=zh_CN.UTF-8'>>/etc/locale.conf // 设置默认

### 设置时区
 * ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

### 主机名
 * echo arch >> /etc/hostname

### 有线链接
 * systemctl start dhcpcd

### 初始化
 * mkinitcpio -p linux

### 修改密码
 * passwd

### 安装grub
 * pacman -S grub-bios
 * grub-install /dev/sdx
 * grub-mkconfig -o /boot/grub/grub.cfg

## 结尾

### 退出配置系统
 * exit

### 卸载挂在盘
 * umount -R /mnt

### 重新系统
 * reboot
