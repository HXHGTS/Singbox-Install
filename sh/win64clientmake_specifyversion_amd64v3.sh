#!/bin/bash

# check if the argument is --version

if [ "$1" == "--version" ]; then

    # check if the second argument is not empty

    if [ -n "$2" ]; then

        Singbox_Version=$2

        echo '正在打开Go环境. . .'

        source /root/.bashrc

        go version

        echo '正在编译Windows版sing-box核心. . .'

        Singbox_Version=$(curl https://api.github.com/repos/SagerNet/sing-box/releases | grep "tag_name" | grep '-' | head -n 1 | gawk -F\" '{print $4}')

        env GOOS=windows GOARCH=amd64 GOAMD64=v3 CGO_ENABLED=0 go install -ldflags "-X github.com/sagernet/sing-box/constant.Version=${Singbox_Version}" -v -tags with_quic,with_grpc,with_dhcp,with_wireguard,with_ech,with_utls,with_reality_server,with_gvisor github.com/sagernet/sing-box/cmd/sing-box@${Singbox_Version}

        echo 'sing-box Windows版客户端已编译完成!'

    else

        # print an error message

        echo "请在--version后指定具体的参数,如v1.8.5"

    fi

else

    # print the usage of the script

    echo "使用方法: win64clientmake_specifyversion_amd64v3.sh --version %VERSION%"

fi
