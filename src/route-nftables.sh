#!/bin/bash
# date 2021-12-19 23:27:24
# author calllivecn <calllivecn@outlook.com>

start(){
	nft add rule inet filter route iif ${LAN_IFNAME} udp dport { 67, 68 } counter accept comment \"准许 DHCP udp port 67 通过 ${LAN_IFNAME} \"
	nft add rule inet filter postrouting oifname ${WLAN_IFNAME} counter masquerade
}

stop(){
	nft flush chain inet filter route 
	nft flush chain inet filter postrouting
}

if [ "$1"x = "start"x ];then
	start
elif [ "$1"x = "stop"x ];then
	stop
else
	echo "route-nftables.sh <start|stop>"
	exit 1
fi
