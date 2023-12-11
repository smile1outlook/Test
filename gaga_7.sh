#!/bin/bash

apt update && apt install sudo docker.io curl && sudo rm -rf /sbin/initctl && sudo ln -s /sbin/initctl.distrib /sbin/initctl && export TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 && wget https://github.com/jepbura/gaganode/raw/master/gaganode_install.sh && sudo chmod +x gaganode_install.sh && sudo apt install screen -y && screen -d -m ./gaganode_install.sh


City=("United States" "Netherlands" "Japan")
i=0
for city in "${City[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$city" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  echo $i $city
  i=$(($i+1))
done

# City_ipvanish=("Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan" "Tirana" "Sydney" "Vienna" "Brussels" "Sao Paulo" "Toronto" "Bogota" "Prague" "Budapest" "Dublin" "Guadalajara" "Oslo")

#ipvanish_resvpn=("atl-a50.ipvanish.com" "lax-a07.ipvanish.com" "lax-a38.ipvanish.com" "nyc-a47.ipvanish.com" "den-a07.ipvanish.com" "lax-a38.ipvanish.com" "iad-a07.ipvanish.com" "sea-a07.ipvanish.com" "atl-a25.ipvanish.com" "chi-a12.ipvanish.com" "nyc-a07.ipvanish.com" "sjc-a07.ipvanish.com" "iad-a71.ipvanish.com" clt-c41.ipvanish.com "syd-a23.ipvanish.com" "mia-a13.ipvanish.com" lax-b28.ipvanish.com "atl-a63.ipvanish.com" "nrt-a17.ipvanish.com" "bod-c06.ipvanish.com" "beg-c04.ipvanish.com" "par-a19.ipvanish.com" "sto-a07.ipvanish.com" "mad-a07.ipvanish.com" "lin-a19.ipvanish.com")

#for city in "${ipvanish_resvpn[@]}"; do
#  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_HOSTNAMES="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#  docker logs --tail 5 vpn$i
#  echo $i $city
#  i=$(($i+1))
#done

# purevpn_city=("Miami" "Phoenix" "Los Angeles" "Chicago" "New Jersey" "New York" "Houston" "Atlanta" "Washington DC" "Ashburn" "San Francisco" "Seattle" "Salt Lake City" "Seoul" "Melbourne" "Brisbane" "Sydney" "Perth")
purevpn_region=("Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois")
for city in "${purevpn_region[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=purevpn --env OPENVPN_USER=purevpn0s7712364 --env OPENVPN_PASSWORD=bn0f9y3mn2qf --env SERVER_REGIONS="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  docker logs --tail 5 vpn$i
  echo $i $city
  i=$(($i+1))
done
# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Hit CTRL+C'; sleep 30; done