#!/bin/sh
dir=/opt/deepinwine/apps/Deepin-WeChat/
# 判断是否安装
if [ ! -d $dir ];then
    echo '没有安装微信客户端！'
fi

# 获取执行sudo命令
sudo ls >/dev/null

# 安装新版
wget -P ~/Downloads/ http://dldir1.qq.com/weixin/Windows/WeChatSetup.exe
WINEPREFIX=~/.deepinwine/Deepin-WeChat/ deepin-wine ~/Downloads/WeChatSetup.exe

# 复制files.7z和更新微信文件
cd ~/.deepinwine/Deepin-WeChat/
cp $dir/files.7z ./files.7z
7z d files.7z drive_c/Program\ Files/Tencent/WeChat
7z a files.7z drive_c/Program\ Files/Tencent/WeChat user.reg userdef.reg

# 备份和替换和删除原来的部署
if [ ! -d $dir/files.7z.bak ];then
    sudo mv $dir/files.7z $dir/files.7z.bak
fi
sudo cp ./files.7z $dir/files.7z
rm -f files.7z

echo '封包成功！'

