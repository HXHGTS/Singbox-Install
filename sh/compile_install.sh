#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

echo '正在打开Go环境. . .'

source /root/.bashrc

go version

echo '正在编译linux版sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | head -n 1 | gawk -F\" '{print $4}')

env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go install -ldflags "-X github.com/sagernet/sing-box/constant.Version=${Singbox_Version}" -v github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

echo '正在安装sing-box核心. . .'

Set_ConfDir=/etc/sing-box

Set_BinDir=/usr/bin

mv -f /root/go/bin/sing-box ${Set_BinDir}

chmod +x ${Set_BinDir}/sing-box

mkdir -p ${Set_ConfDir}

echo '{}' > ${Set_ConfDir}/config.json

curl https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/service/sing-box.service > /usr/lib/systemd/system/sing-box.service

curl https://raw.githubusercontent.com/HXHGTS/Singbox-Install/main/service/sing-box@.service > /usr/lib/systemd/system/sing-box@.service

systemctl daemon-reload

systemctl start sing-box

echo 'sing-box核心已安装!'

exit 0
