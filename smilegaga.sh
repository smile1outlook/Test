#!/bin/bash

apt update && apt install sudo docker.io curl && sudo rm -rf /sbin/initctl && sudo ln -s /sbin/initctl.distrib /sbin/initctl && export TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 && wget https://github.com/jepbura/gaganode/raw/master/gaganode_install.sh && sudo chmod +x gaganode_install.sh && sudo apt install screen -y && screen -d -m ./gaganode_install.sh


# City=("United States" "Netherlands" "Japan")
i=1
# for city in "${City[@]}"; do
#   docker run -itd --name vpn$i --cap-add=NET_ADMIN --env VPN_SERVICE_PROVIDER=protonvpn --env OPENVPN_USER=o1Qk8A7NBqkFRJms --env OPENVPN_PASSWORD=zKBloSojLyfmQtU6jex9UY4QU2YeczL0 --env SERVER_COUNTRIES="$city" --env FREE_ONLY=on -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
#   echo $i $city
#   i=$(($i+1))
# done

# City_ipvanish=("Ashburn" "Atlanta" "Boston" "Charlotte" "Chicago" "Dallas" "Cincinnati" "Miami" "New York" "Phoenix" "San Jose" "Seattle" "Denver" "Las Vegas" "Los Angeles" "Houston" "Montreal" "Luxembourg" "Madrid" "Manchester" "Marseille" "Melbourne" "Marseille" "Paris" "Milan" "Tirana" "Sydney" "Vienna" "Brussels" "Sao Paulo" "Toronto" "Bogota" "Prague" "Budapest" "Dublin" "Guadalajara" "Oslo")
# "Latvia"
ipvanish_resvpn=("atl-a43.ipvanish.com" "lax-a01.ipvanish.com" "nyc-a41.ipvanish.com" "den-a01.ipvanish.com" "lax-a32.ipvanish.com" "iad-a01.ipvanish.com" "sea-a01.ipvanish.com" "atl-a19.ipvanish.com" "chi-a07.ipvanish.com" "nyc-a01.ipvanish.com" "sjc-a01.ipvanish.com" "iad-a77.ipvanish.com" "chi-a01.ipvanish.com" "syd-a29.ipvanish.com" "mia-a07.ipvanish.com" "mia-a02.ipvanish.com" "atl-a69.ipvanish.com" "sel-a03.ipvanish.com" "mrs-c07.ipvanish.com" "otp-c04.ipvanish.com" "bts-c05.ipvanish.com" "par-a25.ipvanish.com" "sto-a01.ipvanish.com" "mad-a01.ipvanish.com" "lin-a13.ipvanish.com" "atl-a44.ipvanish.com" "lax-a02.ipvanish.com" "lax-a33.ipvanish.com" "nyc-a42.ipvanish.com" "den-a02.ipvanish.com" "lax-a33.ipvanish.com" "iad-a02.ipvanish.com" "sea-a02.ipvanish.com" "atl-a20.ipvanish.com" "chi-a08.ipvanish.com" "nyc-a02.ipvanish.com" "sjc-a02.ipvanish.com" "iad-a76.ipvanish.com" "chi-a02.ipvanish.com" "syd-a28.ipvanish.com" "mia-a08.ipvanish.com" "mia-a01.ipvanish.com" "atl-a68.ipvanish.com" "sel-a02.ipvanish.com" "mrs-c06.ipvanish.com" "otp-c05.ipvanish.com" "par-a24.ipvanish.com" "sto-a02.ipvanish.com" "mad-a02.ipvanish.com" "lin-a14.ipvanish.com" "atl-a45.ipvanish.com" "lax-a03.ipvanish.com" "lax-a34.ipvanish.com" "nyc-a43.ipvanish.com" "den-a03.ipvanish.com" "lax-a34.ipvanish.com" "iad-a03.ipvanish.com" "sea-a03.ipvanish.com" "atl-a21.ipvanish.com" "chi-a09.ipvanish.com" "nyc-a03.ipvanish.com" "sjc-a03.ipvanish.com" "iad-a75.ipvanish.com" "chi-a03.ipvanish.com" "syd-a27.ipvanish.com" "mia-a09.ipvanish.com" "mia-a03.ipvanish.com" "atl-a67.ipvanish.com" "sel-a01.ipvanish.com" "mrs-c05.ipvanish.com" "otp-c06.ipvanish.com" "par-a23.ipvanish.com" "sto-a03.ipvanish.com" "mad-a03.ipvanish.com" "lin-a15.ipvanish.com")
array=("Canada" "Chile" "Colombia" "Costa Rica" "Croatia" "Czech Republic" "Denmark" "Estonia" "Finland" "France" "Germany" "Greece" "Hungary" "Iceland" "India" "Ireland" "Italy" "Japan" "Luxembourg" "Malaysia" "Mexico" "Moldova" "Netherlands" "New Zealand" "Norway" "Peru" "Poland" "Portugal" "Romania" "Serbia" "Singapore" "Slovakia" "Slovenia" "Spain" "Sweden" "Switzerland" "Turkey" "United Arab Emirates" "United Kingdom" "United States" "Korea") 

size=${#array[@]}

for j in {1..6}; do
  index=$(($RANDOM % $size))
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_COUNTRIES=${array[$index]} -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode 
  until docker logs --tail 3 gaga$i | grep 'node started'; do if docker logs --tail 4 gaga$i | grep -E 'vpn|err:|node config will|ERRO|command not found'; then docker stop vpn$i gaga$i && docker rm vpn$i gaga$i && sleep 10 && index=$(($RANDOM % $size)) && docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_COUNTRIES=${array[$index]} -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode && sleep 5; else echo retrying.. $i && docker logs --tail 4 gaga$i && sleep 10; fi; done
  docker logs --tail 3 gaga$i
  echo $i
  i=$(($i+1))
done

creates () {
  docker run -itd --name vpn$i --cap-add=NET_ADMIN --env BLOCK_MALICIOUS=off --env BLOCK_SURVEILLANCE=off --env BLOCK_ADS=off --env DOT=off --env VPN_SERVICE_PROVIDER=ipvanish --env OPENVPN_USER=isinift180115@gmail.com --env OPENVPN_PASSWORD=Hoarse15 --env SERVER_COUNTRIES=${array[$index]} -p 90$i:90$i -p 514$i:514$i -p 514$i:514$i/udp qmcgaw/gluetun && sleep 10 && sudo docker run -itd --name gaga$i --network=container:vpn$i --env TOKEN=hbzrwiekmvbdlaqudd1ea590f967ccf9 jepbura/gaganode
}

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
