#!/bin/bash
# Only For CentOS/RedHat Distribution

sudo yum update -y 
Version=`docker --version | awk '{print $1}'`
if [ $Version == "Docker" ]
then	
	echo "Docker is Installed on Your Mashine..\n\n"
	exit
else
	directory=`pwd`
	echo -e "\nInstall Docker on the system\n"
	sudo yum update -y
	sudo yum curl -y 
	sudo curl -fSsl https://get.docker.com -o $directory/Docker.sh
	sudo chmod +x $directory/Docker.sh
	sleep 3
	sh $directory/Docker.sh
	echo "\n\n         <<  Done!  >> "
fi
