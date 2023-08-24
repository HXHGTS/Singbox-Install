#!/bin/sh

apt update

apt install -y wget tar

rm -rf /usr/local/go

wget -O /var/tmp/go1.21.0.linux-amd64.tar.gz https://go.dev/dl/go1.21.0.linux-amd64.tar.gz

tar -C /usr/local -xzf /var/tmp/go1.21.0.linux-amd64.tar.gz

rm -f /var/tmp/go1.21.0.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

go version

go install -v -tags with_quic with_dhcp with_wireguard with_utls with_reality_server with_acme with_gvisor github.com/sagernet/sing-box/cmd/sing-box@latest

