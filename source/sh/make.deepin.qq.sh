#!/bin/sh
dir=/opt/deepinwine/apps/Deepin-QQ/
# 判断是否安装
if [ ! -d $dir ];then
    echo '没有安装QQ！'
fi

# 获取执行sudo命令
sudo ls >/dev/null

wget -P ~/Downloads `curl -s https://im.qq.com/pcqq/ | grep exe | awk '{print $2}' | awk 'BEGIN{FS="\""}{print $2}'`

WINEPREFIX=~/.deepinwine/Deepin-QQ/ deepin-wine ~/Downloads/`ls ~/Downloads | grep QQ`

# 复制files.7z和更新QQ文件
cd ~/.deepinwine/Deepin-QQ/
cp $dir/files.7z ./files.7z
7z d files.7z drive_c/Program\ Files/Tencent/QQ
7z a files.7z drive_c/Program\ Files/Tencent/QQ user.reg userdef.reg

# 备份和替换和删除原来的部署
if [ ! -d $dir/files.7z.bak ];then
    sudo mv $dir/files.7z $dir/files.7z.bak
fi
sudo cp ./files.7z $dir/files.7z
rm -f files.7z

echo '封包成功！'