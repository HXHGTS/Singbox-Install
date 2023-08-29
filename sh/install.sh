#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

echo '正在安装/升级必需插件. . .'

apt update

apt install -y curl wget tar gawk sed

echo '正在下载linux版sing-box核心. . .'

wget -O /usr/local/bin/sing-box https://github.com/HXHGTS/Singbox-Install/releases/latest/download/sing-box

echo '正在安装sing-box核心. . .'

chmod +x /usr/local/bin/sing-box

Default_ConfDir=/etc/sing-box

Set_ConfDir=/usr/local/etc/sing-box

Default_BinDir=/usr/bin/sing-box

Set_BinDir=/usr/local/bin/sing-box

mkdir -p ${Set_ConfDir}

echo '{}' > ${Set_ConfDir}/config.json

curl https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box.service | sed -e "s@${Default_ConfDir}@${Set_ConfDir}@g;s@${Default_BinDir}@${Set_BinDir}@g" > /etc/systemd/system/sing-box.service

curl https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box@.service | sed -e "s@${Default_ConfDir}@${Set_ConfDir}@g;s@${Default_BinDir}@${Set_BinDir}@g" > /etc/systemd/system/sing-box@.service

systemctl daemon-reload

systemctl start sing-box

echo 'sing-box核心已安装!'

exit 0
