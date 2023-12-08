#!/bin/bash

apt update && apt install sudo docker.io curl && sudo rm -rf /sbin/initctl && sudo ln -s /sbin/initctl.distrib /sbin/initctl && export TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 && wget https://github.com/jepbura/gaganode/raw/master/gaganode_install.sh && sudo chmod +x gaganode_install.sh && sudo apt install screen -y && screen -d -m ./gaganode_install.sh


# City=("United States" "Netherlands" "Japan" "United States" "Netherlands" "Japan")
i=0
# for city in "${City[@]}"; do
#   docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$city" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#   echo $i $city
#   i=$(($i+1))
# done

#City_ipvanish=("Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan")

ipvanish_resvpn=("atl-a43.ipvanish.com" "lax-a01.ipvanish.com" "nyc-a41.ipvanish.com" "den-a01.ipvanish.com" "lax-a32.ipvanish.com" "iad-a01.ipvanish.com" "sea-a01.ipvanish.com" "atl-a19.ipvanish.com" "chi-a07.ipvanish.com" "nyc-a01.ipvanish.com" "sjc-a01.ipvanish.com" "iad-a77.ipvanish.com" "chi-a01.ipvanish.com" "syd-a29.ipvanish.com" "mia-a07.ipvanish.com" "mia-a02.ipvanish.com" "atl-a69.ipvanish.com" "sel-a03.ipvanish.com" "mrs-c07.ipvanish.com" "otp-c04.ipvanish.com" "bts-c05.ipvanish.com" "par-a25.ipvanish.com" "sto-a01.ipvanish.com" "mad-a01.ipvanish.com" "" "lin-a13.ipvanish.com" "tia-c03.ipvanish.com" "eze-c03.ipvanish.com" "adl-c06.ipvanish.com" "vie-c13.ipvanish.com" "bru-c32.ipvanish.com" "gru-c07.ipvanish.com" "sof-c05.ipvanish.com" "yul-c29.ipvanish.com" "scl-c05.ipvanish.com" "bog-c11.ipvanish.com" "sjo-c03.ipvanish.com" "zag-c09.ipvanish.com" "prg-c18.ipvanish.com" "cph-c35.ipvanish.com" "tll-c08.ipvanish.com" "hel-c02.ipvanish.com")


for city in "${ipvanish_resvpn[@]}"; do
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_HOSTNAMES="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 30 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
  docker logs --tail 5 vpn$i
  echo $i $city
  i=$(($i+1))
done
# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Hit CTRL+C'; sleep 30; done
