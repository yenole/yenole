---
title: 封装deepin-wine应用
date: 2018-05-23 15:54:02
tags: 
    - deepin-wine
categories: 
    - deepin-wine
---

### 原理
 * 使用7z命令修改官方封装后的files.7z文件
 
### 更新微信为例
 * 下载新版
```
wget http://dldir1.qq.com/weixin/Windows/WeChatSetup.exe
```
 * 使用deepin-wine命令安装
 ```
 # WINEPREFIX设置wine容器目录
 WINEPREFIX=~/.deepinwine/Deepin-WeChat deepin-wine WeChatSetup.exe
 ```
 * 安装好新版微信同window
 * 新版运行问题就需要解决问题后再封包

### 封装files.7z
 * 复制files.7z
 ```
 # 复制files.7z到容器目录中，为什么是容器目录，是为了后续方便，也可以是其他目录
 cp /opt/deepinwine/apps/Deepin-WeChat/files.7z ~/.deepinwine/Deepin-WeChat/
 ```
 * 删除files.7z文件中旧版微信
 ```
 # 其实也可以不删除，直接添加新版到files.7z中
 7z d ./files.7z drive_c/Program\ Files/Tencent/WeChat/
 ```
 * 添加新版本客户端
 ```
 # 如果软件有写入注册表数据，还需要添加“system.reg、userdef.reg、user.reg”
 7z a ./files.7z drive_c/Program\ Files/Tencent/WeChat/
 ```
 * 替换原files.7z文件
 ```
 # 替换文件
 sudo cp ./files.7z /opt/deepinwine/apps/Deepin-WeChat/files.7z
 # 修改run.sh文件版本
 sudo nano /opt/deepinwine/apps/Deepin-WeChat/run.sh
 ```