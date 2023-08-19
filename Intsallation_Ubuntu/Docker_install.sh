#!/bin/bash
# Only For Ubuntu/Debian Distribution

sudo apt-get update -y 
Version=`docker --version | awk '{print $1}'`
if [ $Version == "Docker" ]
then	
	echo "Docker is Installed on Your Mashine..\n\n"
	exit
else
	directory=`pwd`
	echo -e "\nInstall Docker on the system\n"
	sudo apt-get update -y
	sudo apt-get curl -y 
	sudo curl -fSsl https://get.docker.com -o $directory/Docker.sh
	sudo chmod +x $directory/Docker.sh
	sleep 3
	bash $directory/Docker.sh
	echo -e "\n\n         <<  Done!  >> "
fi
