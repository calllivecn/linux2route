#!/bin/bash
# date 2020-10-13 21:49:57
# author calllivecn <c-all@qq.com>

SYSTEMD_UNIT="/etc/systemd/system/"

HOSTPAD_DIR="/etc/hostapd/"

set -e

[ -d $HOSTAPD_DIR ] || mkdir -vp $HOSTAPD_DIR

cp -v linux2route.conf $HOSTPAD_DIR
cp -v mkbridge.sh $HOSTPAD_DIR
cp -v route-dnsmasq.conf $HOSTPAD_DIR
cp -v hostapd.conf $HOSTPAD_DIR

cp -v hostapd.service $SYSTEMD_UNIT
cp -v mkbridge.service $SYSTEMD_UNIT
cp -v route-dnsmasq.service $SYSTEMD_UNIT
cp -v route-nftables.service $SYSTEMD_UNIT
cp -v mkVirtualIw.service $SYSTEMD_UNIT

systemctl daemon-reload || echo "请手动执行 sudo systemctl daemon-reload"
