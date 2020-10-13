#!/bin/bash
# date 2020-08-03 22:36:00
# author calllivecn <c-all@qq.com>

# $0 --> /etc/NetworkManager/dispatch.d/
# chown root.root $0
# chmod 755 $0
#


ifname="$1"
status="$2"
#connect_id="$CONNECTION_ID"

# 设置你的目标连接名
con_id=""

echo "network manager dispatch script CON_NAME: $CONNECTION_ID"

if [ "$con_id"x = "$CONNECTION_ID"x ];then

	case "$2" in
		up)
			echo "先出测试一下nmcli dispatch shell。ifname: $ifname STAUS: $status"

			;;
		down)
			echo "先出测试一下nmcli dispatch shell。ifname: $ifname STAUS: $status"
			;;
	esac
fi
