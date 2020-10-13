#!/bin/bash
# date 2020-07-21 01:07:55
# author calllivecn <c-all@qq.com>

set -ex


PHYICAL_WIFI="wlp7s0"
#VIRTUAL_WIFI="VAP0"
VIRTUAL_WIFI="$1"
#GATEWAY_IP="192.168.7.1/24"

if [ -n "$(ip -br link |awk '{print $1}' |grep "$VIRTUAL_WIFI")" ];then
	# delete
	iw dev "$VIRTUAL_WIFI" del
	sleep 1
fi

iw dev "$PHYICAL_WIFI" interface add "$VIRTUAL_WIFI" type managed addr "8c:c6:81:15:83:b8"

sleep 1

#ip addr add dev "$VIRTUAL_WIFI" "$GATEWAY_IP"

#nft add rule inet filter postrouting oif "$PHYICAL_WIFI" ip saddr 192.168.7.0/24 counter masquerade

nft add rule inet filter route iif "$VIRTUAL_WIFI" counter accept

hostapd -i "$VIRTUAL_WIFI" /etc/hostapd/AP0.conf
