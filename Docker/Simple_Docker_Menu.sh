#!/bin/bash

# Pull Any Images From DockerHub
# Delete Images
# Creating Simple Container

H=`hostname -I | awk '{print $1}'`
EXIT="no"
while [ "True" ]
do
        sleep 1.5
        echo -e "\n\t\t\t<< Menu: (3 Option Only) >>\n\n1.Pull Images From DockerHub\n2.Delete Image's\n3.Deploy Container\n"
        read CH
        if [ $CH == "1" ]
        then
                echo -e "\nEnter a Name of image: "
                read IMAGE
                SEARCH=`sudo docker search $IMAGE | awk 'NR==2 {print $1}'`
                if [ $SEARCH == $IMAGE ]
                then
                        sudo docker pull $SEARCH
                        echo -e "OK"
                else
                        echo "Image Not Found:\n "
                        continue
                fi
        elif [ $CH == "2" ]
        then
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
                        continue
                fi
        elif [ $CH == "3" ]
        then
                echo -e "\n\nCreating Container: \n\nChoose an ImageOS To Containerized: "
                read NAME_I
                echo -e "Named Your Container: "
                read TAG
                sudo docker run -itd --name $TAG $NAME_I /bin/bash -c 'while true ; do `hostname -I` ; sleep 1 ; done'
        else
                echo "Enter 1-3 Only !!!"
                continue
        echo -e "\n\nDo You want To Exit? yes/no  y/n Y/N"
        read EXIT
        if [ $EXIT == "y" ] || [ $EXIT == "yes" ] || [ $EXIT == "Yes" ] || [ $EXIT == "Y" ]
        then
                break
        fi
        fi

done
