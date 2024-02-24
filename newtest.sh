#!/bin/sh

wget -O Dockerfile https://github.com/smile1outlook/Test/raw/master/Dockerfile2
docker build . -t smile
> socks.txt
while read a; do echo $a | cut -f1,2 -d':' >> socks.txt; done<socks5.txt

EXTRA_COMMANDS='echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf;ip rule add iif lo ipproto udp dport 53 lookup main;'
#echo "hallo $proxy"
docker stop $(docker ps -aq)
i=1
head -n 100 socks.txt | while read proxy; do
	echo $proxy
	docker run -itd --rm --name tunsmile$i -e LOGLEVEL=$TUN_LOG_PARAM -e PROXY="socks5://$proxy" -e EXTRA_COMMANDS="$EXTRA_COMMANDS" -v '/dev/net/tun:/dev/net/tun' --cap-add=NET_ADMIN -d xjasonlyu/tun2socks:v2.5.2
	sleep 1
	docker run -itd --rm --name gaga$i --network=container:tunsmile$i --env TOKEN=ojxqyftmctxeokuq1450466264c9f23f smile
	#until docker logs --tail 2 gaga$i | grep 'node started'; do docker logs --tail 2 gaga$i && sleep 2; done
	i=$(($i+1))
done
