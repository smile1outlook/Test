#!/bin/bash

apt update && apt install sudo docker.io curl && sudo rm -rf /sbin/initctl && sudo ln -s /sbin/initctl.distrib /sbin/initctl && export TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 && wget https://github.com/jepbura/gaganode/raw/master/gaganode_install.sh && sudo chmod +x gaganode_install.sh && sudo apt install screen -y && screen -d -m ./gaganode_install.sh


# City=("United States" "Netherlands" "Japan")
i=0
# for city in "${City[@]}"; do
#   docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$city" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#   echo $i $city
#   i=$(($i+1))
# done

# City_ipvanish=("Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan" "Tirana" "Sydney" "Vienna" "Brussels" "Sao Paulo" "Toronto" "Bogota" "Prague" "Budapest" "Dublin" "Guadalajara" "Oslo" "Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan" "Tirana" "Sydney" "Vienna" "Brussels" "Sao Paulo" "Toronto" "Bogota" "Prague" "Budapest" "Dublin" "Guadalajara" "Oslo")

ipvanish_resvpn=("atl-a44.ipvanish.com" "lax-a02.ipvanish.com" "lax-a33.ipvanish.com" "nyc-a42.ipvanish.com" "den-a02.ipvanish.com" "lax-a33.ipvanish.com" "iad-a02.ipvanish.com" "sea-a02.ipvanish.com" "atl-a20.ipvanish.com" "chi-a08.ipvanish.com" "nyc-a02.ipvanish.com" "sjc-a02.ipvanish.com" "iad-a76.ipvanish.com" "chi-a02.ipvanish.com" "syd-a28.ipvanish.com" "mia-a08.ipvanish.com" "mia-a01.ipvanish.com" "atl-a68.ipvanish.com" "sel-a02.ipvanish.com" "mrs-c06.ipvanish.com" "otp-c05.ipvanish.com" "par-a24.ipvanish.com" "sto-a02.ipvanish.com" "mad-a02.ipvanish.com" "lin-a14.ipvanish.com" "atl-a45.ipvanish.com" "lax-a03.ipvanish.com" "lax-a34.ipvanish.com" "nyc-a43.ipvanish.com" "den-a03.ipvanish.com" "lax-a34.ipvanish.com" "iad-a03.ipvanish.com" "sea-a03.ipvanish.com" "atl-a21.ipvanish.com" "chi-a09.ipvanish.com" "nyc-a03.ipvanish.com" "sjc-a03.ipvanish.com" "iad-a75.ipvanish.com" "chi-a03.ipvanish.com" "syd-a27.ipvanish.com" "mia-a09.ipvanish.com" "mia-a03.ipvanish.com" "atl-a67.ipvanish.com" "sel-a01.ipvanish.com" "mrs-c05.ipvanish.com" "otp-c06.ipvanish.com" "par-a23.ipvanish.com" "sto-a03.ipvanish.com" "mad-a03.ipvanish.com" "lin-a15.ipvanish.com")

for city in "${ipvanish_resvpn[@]}"; do
 docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_HOSTNAMES="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
 docker logs --tail 5 vpn$i
 echo $i $city
 i=$(($i+1))
done

# purevpn_city=("Miami" "Phoenix" "Los Angeles" "Chicago" "New Jersey" "New York" "Houston" "Atlanta" "Washington DC" "Ashburn" "San Francisco" "Seattle" "Salt Lake City" "Seoul" "Melbourne" "Brisbane" "Sydney" "Perth")
# purevpn_region=("Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois" "New York" "Texas" "Washington" "Virginia" "Utah" "Arizona" "California" "Florida" "Georgia" "Illinois")
# for city in "${purevpn_region[@]}"; do
#   docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=purevpn --env OPENVPN_USER=purevpn0s7712364 --env OPENVPN_PASSWORD=bn0f9y3mn2qf --env SERVER_REGIONS="$city" -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 20 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#   docker logs vpn$i
#   echo $i $city
#   i=$(($i+1))
# done
# export Country="United States" &&for i in {0..4}; do docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$Country" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode; done
#   
while :; do echo 'Hit CTRL+C'; sleep 30; done
