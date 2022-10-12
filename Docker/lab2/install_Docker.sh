#!/bin/bash

installation(){
        directory=`pwd`
        echo -e "\nInstall Docker on the system\n"
        sudo apt-get update -y
        sudo apt-get curl -y
        sudo curl -fSsl https://get.docker.com -o $directory/Docker.sh
        sudo chmod +x $directory/Docker.sh
        sleep 3
        bash $directory/Docker.sh
        echo -e "\nDone.."
}


build=`docker --version | awk '{print $1}'`
echo "$build"
if [ $build == "docker" ]
then
        echo "docker already install"
else
        intallation()
fi
