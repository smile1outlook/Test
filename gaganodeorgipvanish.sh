#!/bin/bash

apt update && apt install sudo docker.io curl 

echo "token gaga:"
read tokengaga
echo "username vpn:"
read usernamevpn
echo "password vpn:"
read passwordvpn
echo "jumlah node:"
read jumlahnode

array=("Canada" "Chile" "Colombia" "Costa Rica" "Croatia" "Czech Republic" "Denmark" "Estonia" "Finland" "France" "Germany" "Greece" "Hungary" "Iceland" "India" "Ireland" "Italy" "Japan" "Luxembourg" "Malaysia" "Mexico" "Moldova" "Netherlands" "New Zealand" "Norway" "Peru" "Poland" "Portugal" "Romania" "Serbia" "Singapore" "Slovakia" "Slovenia" "Spain" "Sweden" "Switzerland" "Turkey" "United Arab Emirates" "United Kingdom" "United States" "Korea") 

size=${#array[@]}
docker pull qmcgaw/gluetun
docker pull jepbura/gaganode
create_dock () {
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER="$usernamevpn" --env OPENVPN_PASSWORD="$passwordvpn" --env SERVER_COUNTRIES=${array[$index]} qmcgaw/gluetun 
  sleep 10 
  sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=$tokengaga jepbura/gaganode
}
#i=$(($i+1))

for i in $(seq "$jumlahnode"); do
  index=$(($RANDOM % $size))
  create_dock
  docker logs vpn$i
  echo $i;
done

# purevpn_city=("Miami" "Phoenix" "Los Angeles" "Chicago" "New Jersey" "New York" "Houston" "Atlanta" "Washington DC" "Ashburn" "San Francisco" "Seattle" "Salt Lake City" "Seoul" "Melbourne" "Brisbane" "Sydney" "Perth")
#purevpn_region=("Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois")
#for city in "${purevpn_region[@]}"; do
#  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=purevpn --env OPENVPN_USER=purevpn0s7712364 --env OPENVPN_PASSWORD=bn0f9y3mn2qf --env SERVER_REGIONS="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#  docker logs --tail 5 vpn$i
#  echo $i $city
#  i=$(($i+1))
#done

# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Telegram: @smilesense'; sleep 30; done
