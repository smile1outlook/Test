#!/bin/bash

apt update && apt install sudo docker.io curl && sudo rm -rf /sbin/initctl && sudo ln -s /sbin/initctl.distrib /sbin/initctl && export TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 && wget https://github.com/jepbura/gaganode/raw/master/gaganode_install.sh && sudo chmod +x gaganode_install.sh && sudo apt install screen -y && screen -d -m ./gaganode_install.sh


City=("United States" "Netherlands" "Japan" "United States" "Netherlands" "Japan")
i=0
for city in "${City[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$city" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  echo $i $city
  i=$(($i+1))
done

City_ipvanish=("Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan" "Tirana" "Sydney" "Vienna" "Brussels" "Sao Paulo" "Toronto" "Bogota" "Prague" "Budapest" "Dublin" "Guadalajara" "Oslo")

#ipvanish_resvpn=("bod-c09.ipvanish.com" "bru-c32.ipvanish.com" "gru-c07.ipvanish.com" "sof-c05.ipvanish.com" "yul-c29.ipvanish.com" "scl-c05.ipvanish.com" "bog-c11.ipvanish.com" "sjo-c03.ipvanish.com" "zag-c09.ipvanish.com" "prg-c18.ipvanish.com" "cph-c35.ipvanish.com" "tll-c08.ipvanish.com" "hel-c02.ipvanish.com" "fra-a12.ipvanish.com" "ath-c10.ipvanish.com" "hkg-a13.ipvanish.com" "bud-c04.ipvanish.com" "rkv-c02.ipvanish.com" "pnq-c03.ipvanish.com" "dub-c26.ipvanish.com" "nrt-b10.ipvanish.com" "rix-c11.ipvanish.com" "lux-c09.ipvanish.com" "gdl-c05.ipvanish.com" "kiv-c09.ipvanish.com" "ams-a46.ipvanish.com" "akl-c03.ipvanish.com" "osl-c05.ipvanish.com" "lim-c02.ipvanish.com" "waw-a19.ipvanish.com" "lis-c14.ipvanish.com" "sin-a30.ipvanish.com" "zrh-c06.ipvanish.com" "tpe-c02.ipvanish.com" "bkk-c04.ipvanish.com")

for city in "${ipvanish_resvpn[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_CITIES="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  docker logs --tail 5 vpn$i
  echo $i $city
  i=$(($i+1))
done
# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Hit CTRL+C'; sleep 30; done