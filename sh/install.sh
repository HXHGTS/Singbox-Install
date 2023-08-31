#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

echo '正在安装/升级必需插件. . .'

apt update

apt install -y curl wget tar gawk sed git

echo '正在下载linux版sing-box核心. . .'

git clone -b main https://github.com/SagerNet/sing-box

cd sing-box/release/local

./install_go.sh

./install.sh

echo 'sing-box核心已安装!'

exit 0
