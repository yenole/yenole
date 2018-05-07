#!/bin/sh
dir=/opt/deepinwine/apps/Deepin-WeChatDev/
url=https://gitee.com/yenole/deepin.apps/raw/deepin.com.wechat.devtools/files.7z
# 判断是否安装
if [ ! -d $dir ];then
    echo '没有安装微信开发者工具！'
fi

# 获取执行sudo命令
sudo ls >/dev/null

# 下载files.7z
if [ -d /tmp/deepin.apps/ ];then
    rm -rf /tmp/deepin.apps/*
else
    mkdir /tmp/deepin.apps
fi
wget -P /tmp/deepin.apps/ $url

# 备份和替换和删除原来的部署
cd /tmp/deepin.apps
if [ ! -d $dir/files.7z.bak ];then
    sudo mv $dir/files.7z $dir/files.7z.bak
fi
sudo cp ./files.7z $dir/files.7z

# 删除已经部署的和提示安装成功
rm -rf ~/.deepinwine/Deepin-WeChatDev/
echo '安装成功！'


