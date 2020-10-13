#!/bin/bash
# date 2020-07-21 01:07:55
# author calllivecn <c-all@qq.com>

set -ex


PHYICAL_WIFI=$PHY_WIFI_IFNAME
VIRTUAL_WIFI=$VIRTUAL_IW

if [ -n "$(ip -br link |awk '{print $1}' |grep "$VIRTUAL_WIFI")" ];then
	# delete
	iw dev "$VIRTUAL_WIFI" del
	sleep 1
fi

iw dev "$PHYICAL_WIFI" interface add "$VIRTUAL_WIFI" type managed addr "8c:c6:81:15:83:b8"

sleep 1

