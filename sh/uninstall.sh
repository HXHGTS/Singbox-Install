#!/bin/sh

echo '正在关闭/卸载sing-box核心. . .'

systemctl stop sing-box

systemctl disable sing-box

Default_ConfDir=/etc/sing-box

Set_ConfDir=/usr/local/etc/sing-box

Default_BinDir=/usr/bin/sing-box

Set_BinDir=/usr/local/bin/sing-box

rm -rf /root/go/bin /usr/local/etc/sing-box  /var/lib/sing-box

rm -f ${Set_BinDir}

rm -rf ${Set_ConfDir}

rm -f /etc/systemd/system/sing-box.service /etc/systemd/system/sing-box@.service

systemctl daemon-reload

echo 'sing-box核心已卸载!'

exit 0
