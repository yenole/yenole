#!/bin/sh
dir=/opt/deepinwine/apps/Deepin-WeChatDev/
# 判断是否安装
if [ ! -d $dir ];then
    echo '没有安装微信开发者工具！'
fi

# 获取执行sudo命令
sudo ls >/dev/null

# 复制files.7z和更新TIM文件
cd ~/.deepinwine/Deepin-WeChatDev/
cp $dir/files.7z ./files.7z
7z d files.7z drive_c/Program\ Files/WeChat_nwjs/package.nw/
7z a files.7z drive_c/Program\ Files/WeChat_nwjs/package.nw/

# 备份和替换和删除原来的部署
if [ ! -d $dir/files.7z.bak ];then
    sudo mv $dir/files.7z $dir/files.7z.bak
fi
sudo cp ./files.7z $dir/files.7z
rm -f files.7z

echo '封包成功！'