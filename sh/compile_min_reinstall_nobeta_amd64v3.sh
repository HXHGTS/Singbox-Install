#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

echo '正在安装/升级go. . .'

export PATH=$PATH:/usr/local/go/bin

echo '正在编译linux版sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | grep -v '-'| head -n 1 | gawk -F\" '{print $4}')

env GOOS=linux GOARCH=amd64 GOAMD64=v3 CGO_ENABLED=0 go install -ldflags "-X github.com/sagernet/sing-box/constant.Version=${Singbox_Version}" -v -tags with_quic,with_grpc,with_dhcp,with_wireguard,with_ech,with_utls,with_reality_server,with_acme,with_gvisor github.com/sagernet/sing-box/cmd/sing-box@latest

echo '正在安装sing-box核心. . .'

mv -f /root/go/bin/sing-box /usr/local/bin/sing-box

chmod +x /usr/local/bin/sing-box

systemctl start sing-box

systemctl enable sing-box

echo 'sing-box核心已更新!'

exit 0
