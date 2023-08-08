#!/bin/bash

build=`docker --version | awk '{print $1}'`
if [ $build == "docker" ] 2>/dev/null
then
        echo "docker already install"
else
        directory=`pwd`
        echo -e "\nInstall Docker on the system\n"
        sudo apt-get update -y
        sudo apt-get curl -y
        sudo curl -fSsl https://get.docker.com -o $directory/Docker.sh
        sudo chmod +x $directory/Docker.sh
        sleep 3
        bash $directory/Docker.sh
        echo -e "\nDone.."
fi
