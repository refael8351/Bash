#!/bin/bash

# Simple CD Procces          >>>        Part  [ 3/4 ]
# Simple CD Procces          >>>        Part  [ 4/4 ]


# Deploy 3 Container (Live 24H Only) and Display IP Address of Each once

# Container 1

read -p "Name of Contaier 1: " con1
sudo docker run -itd --name $con1 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
sudo docker logs $con1 | head | awk 'NR==1 {print $4}'
ID1=`sudo docker ps | grep $con1 | awk '{print $1}'`
echo -e "\n\nContainer 1 IP Address: "
sudo docker inspect $ID1 | grep IPAddress | awk 'NR==2'| cut -d '"' -f4
URL1=`sudo docker inspect $ID1 | grep IPAddress | awk 'NR==2' | cut -d '"' -f4`
sudo wget $URL1:80


# Container 2

read -p "Name of Contaier 2: " con2
sudo docker run -itd --name $con2 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
sudo docker logs $con2 | head | awk 'NR==1 {print $4}'
ID2=`sudo docker ps | grep $con2 | awk '{print $1}'`
echo "\n\nContainer 2 IP Address: "
sudo docker inspect $ID2 | grep IPAddress | awk 'NR==2'| cut -d '"' -f4
URL2=`sudo docker inspect $ID2 | grep IPAddress | awk 'NR==2' | cut -d '"' -f4`
sudo wget $URL2:80

# Container 3

read -p "Name of Contaier 3: " con3
sudo docker run -itd --name $con3 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
sudo docker logs $con3 | head | awk 'NR==1 {print $4}'
ID3=`sudo docker ps | grep $con3 | awk '{print $1}'`
echo "\n\nContainer 3 IP Address: "
sudo docker inspect $ID3 | grep IPAddress | awk 'NR==2' | cut -d '"' -f4
URL3=`sudo docker inspect $ID3 | grep IPAddress | awk 'NR==2' | cut -d '"' -f4`
sudo wget $URL3:80

