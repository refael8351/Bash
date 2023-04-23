#!/bin/bash

#Removing Images By Choice

LIST_I=`sudo docker images -q`
ID_I=`for i in $LIST_I ; do echo $i ; done`
sudo docker images
echo -e "\nWhich Image ID Do You Want To Remove?"
read RMI
sudo docker rmi $RMI 2>/dev/null
if [ $RMI  == $ID_I ]
then
        echo -e "\nRemoving Successfull $RMI\n"
else
        echo -e "\nImage ID Not Found: Try Again\n\n"
fi

