#!/bin/sh

echo '正在打开Go环境. . .'

source /root/.bashrc

go version

echo '正在编译Windows版sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | grep '-'| head -n 1 | gawk -F\" '{print $4}')

env GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go install -ldflags "-X github.com/sagernet/sing-box/constant.Version=${Singbox_Version}" -v -tags with_quic,with_grpc,with_dhcp,with_wireguard,with_ech,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

echo 'sing-box Windows版客户端已编译完成!'

exit 0
