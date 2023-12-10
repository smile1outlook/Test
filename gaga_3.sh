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

ipvanish_resvpn=("atl-a45.ipvanish.com" "lax-a03.ipvanish.com" "lax-a34.ipvanish.com" "nyc-a43.ipvanish.com" "den-a03.ipvanish.com" "lax-a34.ipvanish.com" "iad-a03.ipvanish.com" "sea-a03.ipvanish.com" "atl-a21.ipvanish.com" "chi-a09.ipvanish.com" "nyc-a03.ipvanish.com" "sjc-a03.ipvanish.com" "iad-a75.ipvanish.com" "chi-a03.ipvanish.com" "syd-a27.ipvanish.com" "mia-a09.ipvanish.com" "mia-a03.ipvanish.com" "atl-a67.ipvanish.com" "sel-a01.ipvanish.com" "mrs-c05.ipvanish.com" "otp-c06.ipvanish.com" "par-a23.ipvanish.com" "sto-a03.ipvanish.com" "mad-a03.ipvanish.com" "lin-a15.ipvanish.com")

for city in "${ipvanish_resvpn[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_HOSTNAMES="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  docker logs --tail 5 vpn$i
  echo $i $city
  i=$(($i+1))
done
# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Hit CTRL+C'; sleep 30; done