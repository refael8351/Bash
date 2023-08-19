#!/bin/bash

# Simple CD Procces          >>>        Part  [ 3/4 ]
# Simple CD Procces          >>>        Part  [ 4/4 ]


# Deploy 3 Container (Live 24H Only) and Display IP Address of Each once

# Container 1

read -p "Name of Contaier 1: " con1
sudo docker run -itd --name $con1 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs $con1 | head | awk 'NR==1 {print $4}'

# Container 2

read -p "Name of Contaier 2: " con2
sudo docker run -itd --name $con2 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs $con2 | head | awk 'NR==1 {print $4}'

# Container 3

read -p "Name of Contaier 3: " con3
sudo docker run -itd --name $con3 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs $con3 | head | awk 'NR==1 {print $4}'
