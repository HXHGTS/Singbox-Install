#!/bin/sh

echo '正在安装/升级必需插件. . .'

apt update

apt install -y curl wget tar

echo '正在安装/升级go. . .'

apt remove -y --purge golang

apt autoremove -y

rm -rf /usr/local/go

Go_Version=${curl https://github.com/golang/go/tags | grep '/releases/tag/go' | head -n 1 | awk -F/ '{print $6}' | awk -F\" '{print $1}'}

wget -O /var/tmp/${Go_Version}.linux-amd64.tar.gz https://go.dev/dl/${Go_Version}.linux-amd64.tar.gz

tar -C /usr/local -xzf /var/tmp/${Go_Version}.linux-amd64.tar.gz

rm -f /var/tmp/${Go_Version}.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

go version

echo '正在编译sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | head -n 1 | awk -F\" '{print $4}')

go install -v -tags with_quic,with_dhcp,with_wireguard,with_utls,with_reality_server,with_acme,with_gvisor github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

echo '正在安装sing-box核心. . .'

mv -f /root/go/bin/sing-box /usr/local/bin/

Default_ConfDir=/etc/sing-box

Set_ConfDir=/usr/local/etc/sing-box

mkdir -p ${Set_ConfDir}

wget -O ${Set_ConfDir}/config.json https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/config.json

curl https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box.service | sed -e "s@${Default_ConfDir}@${Set_ConfDir}@g" > /etc/systemd/system/sing-box.service

wget -O /etc/systemd/system/sing-box@.service https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box@.service

systemctl daemon-reload

echo 'sing-box核心已安装!'
