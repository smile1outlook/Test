#!/bin/bash

array=("USA Central" "USA East" "USA West") 
#"Indonesia" "South Korea"
size=${#array[@]}
docker pull qmcgaw/gluetun
docker pull jepbura/gaganode

for i in {1..100}; do
  docker run -itd --rm --cap-add=NET_ADMIN --name vpn$i -e BLOCK_MALICIOUS=off -e BLOCK_SURVEILLANCE=off -e BLOCK_ADS=off -e DOT=off -e VPN_SERVICE_PROVIDER=windscribe -e VPN_TYPE=openvpn -e OPENVPN_USER="6sujvyhr-jpwncz4" -e OPENVPN_PASSWORD="h3dfk2wsy6" -e SERVER_REGIONS="${array[$index]}" qmcgaw/gluetun
  sleep 10
  docker run -itd --rm --name gaga$i--network=container:vpn$i--env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
  

while :; do echo 'Telegram: @smilesense'; sleep 30; done
