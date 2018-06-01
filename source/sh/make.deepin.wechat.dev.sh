#!/bin/sh
dir=/opt/deepinwine/apps/Deepin-WeChatDev/
# 判断是否安装
if [ ! -d $dir ];then
    echo '没有安装微信开发者工具！'
fi

# 获取执行sudo命令
sudo ls >/dev/null

# 解决远程调试问题
mkdir /tmp/node-sync-ipc
cd /tmp/node-sync-ipc
yarn add node-sync-ipc@2.1.2

cd ~/.deepinwine/Deepin-WeChatDev/
rm -rf drive_c/Program\ Files/WeChat_nwjs/package.nw/node_modules/node-sync-ipc
rm -rf drive_c/Program\ Files/WeChat_nwjs/package.nw/node_modules/node-sync-ipc-nwjs
cp -r /tmp/node-sync-ipc/node_modules/node-sync-ipc drive_c/Program\ Files/WeChat_nwjs/package.nw/node_modules/node-sync-ipc
cp -r /tmp/node-sync-ipc/node_modules/node-sync-ipc drive_c/Program\ Files/WeChat_nwjs/package.nw/node_modules/node-sync-ipc-nwjs

cp `type node | awk '{print $3}'` drive_c/Program\ Files/WeChat_nwjs/node.exe
rm -rf /tmp/node-sync-ipc


# 解决插件文件
sed -i 's/load-extension=.\/js/load-extension=.\/package.nw\/js/g' drive_c/Program\ Files/WeChat_nwjs/package.nw/package.json
# 解决nw图标问题
sed -i 's/app\/images\/logo2.png/static\/image\/logo@2x.png/g' drive_c/Program\ Files/WeChat_nwjs/package.nw/package.json

# 复制files.7z和更新文件
cp $dir/files.7z ./files.7z
7z d files.7z drive_c/Program\ Files/WeChat_nwjs/package.nw/
7z a files.7z drive_c/Program\ Files/WeChat_nwjs/package.nw/
7z a files.7z drive_c/Program\ Files/WeChat_nwjs/node.exe

# 备份和替换和删除原来的部署
if [ ! -d $dir/files.7z.bak ];then
    sudo mv $dir/files.7z $dir/files.7z.bak
fi
sudo cp ./files.7z $dir/files.7z
rm -f files.7z

echo '封包成功！'