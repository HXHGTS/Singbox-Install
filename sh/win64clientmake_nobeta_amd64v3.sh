#!/bin/sh

export PATH=$PATH:/usr/local/go/bin

echo '正在编译Windows版sing-box核心. . .'

env GOOS=windows GOARCH=amd64 GOAMD64=v3 CGO_ENABLED=0 go install -ldflags "-X github.com/sagernet/sing-box/constant.Version=${Singbox_Version}" -v -tags with_dhcp,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@latest

echo 'sing-box Windows版客户端已编译完成!'

exit 0
