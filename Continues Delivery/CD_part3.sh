#!/bin/bash

# Simple CD Procces >>> Part 2

# Deploy 3 Container + IP Address of Each once

# Container 1
sudo docker run -itd --name my1 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs my1 | head | awk 'NR==1 {print $4}'

# Container 2
sudo docker run -itd --name my2 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs my2 | head | awk 'NR==1 {print $4}'

# Container 3
sudo docker run -itd --name my3 nginx /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
sleep 3
echo -e "\n\nIP Address:"
sudo docker logs my3 | head | awk 'NR==1 {print $4}'
