#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

echo '正在安装/升级go. . .'

export PATH=$PATH:/usr/local/go/bin

go version

echo '正在编译linux版sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | head -n 1 | gawk -F\" '{print $4}')

env GOARCH=amd64 GOAMD64=v3 CGO_ENABLED=0 go install -v -tags with_quic,with_grpc,with_dhcp,with_wireguard,with_ech,with_utls,with_reality_server,with_acme,with_gvisor github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

echo '正在安装sing-box核心. . .'

mv -f /root/go/bin/sing-box /usr/local/bin/sing-box

chmod +x /usr/local/bin/sing-box

Default_ConfDir=/etc/sing-box

Set_ConfDir=/usr/local/etc/sing-box

Default_BinDir=/usr/bin/sing-box

Set_BinDir=/usr/local/bin/sing-box

mkdir -p ${Set_ConfDir}

curl https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box.service | sed -e "s@${Default_ConfDir}@${Set_ConfDir}@g;s@${Default_BinDir}@${Set_BinDir}@g" > /etc/systemd/system/sing-box.service

curl https://raw.githubusercontent.com/SagerNet/sing-box/dev-next/release/config/sing-box@.service | sed -e "s@${Default_ConfDir}@${Set_ConfDir}@g;s@${Default_BinDir}@${Set_BinDir}@g" > /etc/systemd/system/sing-box@.service

systemctl daemon-reload

systemctl start sing-box

systemctl enable sing-box

echo 'sing-box核心已更新!'

exit 0
