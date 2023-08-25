#!/bin/sh

export PATH=$PATH:/usr/local/go/bin

echo '正在安装/升级必需插件. . .'

apt install -y gcc-mingw-w64

echo '正在编译Windows版sing-box核心. . .'

Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases  | grep "tag_name" | head -n 1 | gawk -F\" '{print $4}')

env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go install -v -tags with_quic,with_grpc,with_dhcp,with_wireguard,with_shadowsocksr,with_ech,with_utls,with_reality_server,with_acme,with_clash_api,with_v2ray_api,with_gvisor github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

echo 'sing-box Windows版客户端已编译完成!'

exit 0
