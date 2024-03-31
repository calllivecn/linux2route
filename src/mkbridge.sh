#!/bin/bash
# date 2020-10-13 14:49:40
# author calllivecn <calllivecn@outlook.com>


set -e

ip link add $LAN_IFNAME type bridge

for slave in $BRIDGES
do
	#echo "$slave"
	ip link set "$slave" master $LAN_IFNAME 
	ip link set "$slave" up
done

ip link set $LAN_IFNAME up

ip addr add $IPNET dev $LAN_IFNAME
