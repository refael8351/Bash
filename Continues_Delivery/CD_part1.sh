#!/bin/bash

# Simple CD Procces       >>>       Part  [ 1/4 ]


# Pull Images From DockerHub

echo -e "\nEnter a Name of image: "
read IMAGE
SEARCH=`sudo docker search $IMAGE | awk 'NR==2 {print $1}'`
if [ $SEARCH == $IMAGE ]
then
        echo "OK"
        sudo docker pull $SEARCH
        sudo docker images | grep $SEARCH
else
        echo "Image Does Not Exist..\n"
fi

