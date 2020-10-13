#!/bin/bash
# date 2020-10-13 14:49:40
# author calllivecn <c-all@qq.com>


make_bridge(){

# Usage: ipbridge.sh <br_name> [slave1 [slave2...]]

if [ -n "$1" ];then
	BR="$1"
else
	echo "需要bridge名"
	return 1
fi

ip link add "$BR" type bridge

shift

for slave in "$@"
do
	#echo "$slave"
	ip link set "$slave" master "$BR" 
done

ip link set "$BR" up

}


make_bridge "$1" "$@"

ip addr add "$GATEWAY_ADDR"
