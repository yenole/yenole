---
title: Linux挂在磁盘
date: 2017-08-29 13:36:43
tags: ["linux"]
categories: "linux"
---
## 切换root，可以跳过
```shell
sudo -i
```

## 查看当前挂在盘
```shell
# Disk /dev/xvdb doesn't contain a valid partition table
fdisk -l
```
## 创建分区
```shell
# 创建分区后可以通过fdisk -l查看信息
fdisk /dev/xvdb
```

## 格式分区
```shell
mkfs.ext3 /dev/xvdb1
```

## 挂在分区
```shell
mkdir /mountdata/
mount /dev/xvdb1 /mountdata/
# 开机自动挂在
echo "/dev/xvdb1	/mountdata	ext3	defaults	0	0">>/etc/fstab
```