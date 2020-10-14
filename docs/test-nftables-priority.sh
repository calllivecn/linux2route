#!/bin/bash
# date 2020-10-14 09:46:55
# author calllivecn <c-all@qq.com>

NFT='sudo nft'


test(){

	$NFT add table inet test

	$NFT add chain inet test p90 \{ type filter hook input priority 90 \; policy accept \; \}

	$NFT add rule inet test p90 icmp type \{ echo-request, time-exceeded \} counter accept

}


clean(){
	$NFT flush table inet test

	$NFT delete chain inet test p90

	$NFT delete table inet test
}


#test
clean
