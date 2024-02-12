#!/bin/bash

apt update && apt install sudo docker.io curl

array=("US West" "US East" "US Central" "South Korea") && size=${#array[@]} && for i in {1..100}; do
  index=$(($RANDOM % $size))
  docker run -itd --rm --cap-add=NET_ADMIN --name vpn$i -e BLOCK_MALICIOUS=off -e BLOCK_SURVEILLANCE=off -e BLOCK_ADS=off -e DOT=off -e VPN_SERVICE_PROVIDER=winscribe -e VPN_TYPE=openvpn -e OPENVPN_USER="mgqt21sr-dmvtns9" -e OPENVPN_PASSWORD="uhma4qbxyn" -e SERVER_REGIONS="${array[$index]}" qmcgaw/gluetun
  until docker top vpn$i; do echo hello && sleep 2; done
  sleep 10
  docker run -itd --rm --name gaga$i --network=container:vpn$i --env TOKEN=oaownzgjaiogwiyza71a4d6da519752c jepbura/gaganode
  docker logs vpn$i && sleep 5;
  done 
