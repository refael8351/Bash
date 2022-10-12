# Creating Docker image and Build Container of DockerUI
# Check With wget if can get The page HTML of the container

#!/bin/bash

docker pull abh1nav/dockerui:latest 2>/dev/null
echo "Enter a Name: "
read NAME
echo "Enter Port Number: "
read PORT
sudo docker run -d -p $PORT:9000 -v /var/run/docker.sock:/docker.sock --name dockerui_$NAME abh1nav/dockerui:latest -e="/docker.sock"
pwd=`pwd`
`wget http://3.22.171.145:$PORT` > info.txt
cat $pwd/info.txt
