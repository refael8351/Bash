#!/bin/bash

#Pulling Images From DockerHub By Chioce

echo -e "\nEnter a Name of image: "
read IMAGE
SEARCH=`sudo docker search $IMAGE | awk 'NR==2 {print $1}'`
if [ $SEARCH == $IMAGE ]
then
	echo "OK"
        sudo docker pull $SEARCH
else
        echo "Image Not Found:\n "
fi


