#!/bin/bash

# Simple CD Procces          >>>         Part  [ 2/4 ]

#   Menu Automation For Docker Images / Container's Action
#       1: Delete Images
#       2: Force Removing Container   ( Warning !! Shut-Down All Container's  ON & OFF )
#       3: Deploy Container + IP Address
#       4: Stop Container's
#       5: Start Container's

H=`hostname -I`
EXIT="no"
while true
do
        sleep 1
        echo -e "\n\t\t\t<< Menu: (3 Option Only) >>\n\n1.Removing Image \n2.Removing Container\n3.Deploy Container\n"
        read CH
        if [ $CH == "1" ]
        then
                LIST_I=`sudo docker images -q`
                ID_I=`for i in $LIST_I ; do echo $i ; done`
                sudo docker images
                echo -e "\nWhich Image ID Do You Want To Remove?  [ Name / ID ]\n"
                read RMI
                sudo docker rmi $RMI 2>/dev/null
                if [ $RMI == $ID_I ]
                then
                        echo -e "\nRemoving Successfull $RMI\n"
                        break
                else
                        echo -e "\nImage ID Not Found: Try Again\n\n"
                        continue
                fi

        elif [ $CH == "2" ]
        then
                PS_LIST=`sudo docker ps -aq`
                PS_ID=`for i in $PS_LIST ; do echo $i ; done`
                echo -e "Showing All Container: \n"
                sudo docker ps -a
                echo -e "\nWhich Container ID Do You Want To Remove?"
                read RM
                sudo docker rm -f $RM
                if [ $RM  == $PS_ID ]
                then
                        echo -e "\nDeleted Successfull $RM\n"
                else
                        echo -e "\nContainer ID Not Found: Try Again\n"
                fi

        elif [ $CH == "3" ]
        then
                sudo docker images | awk '{print $1}'
                echo -e "\n\nChoose an Image From The List ^ :\n"
                read NAME_I
                echo -e "Named Your Container: "
                read TAG
                sleep 1
                sudo docker run -itd --name $TAG $SEARCH /bin/bash -c 'for i in {1..1440} ; do `hostname -I` ; echo $i ; sleep 1 ; done'
                sleep 3
                sudo docker logs $TAG | head | awk 'NR==1 {print $4}'
                break
        elif [ $CH == "4" ]
        then
                PS_LIST=`sudo docker ps -q`
                PS_ID=`for i in $PS_LIST ; do echo $i ; done`
                echo -e "Showing Running Container's: \n"
                sudo docker ps
                echo -e "\nWhich Container ID Do You Want To Stop Run?"
                read STOP
                sudo docker stop $STOP
                if [ $STOP  == $PS_ID ]
                then
                        echo -e "\nStop Container Successfully $STOP\n"
                else
                        echo -e "\nContainer ID Not Found: Check Again\n"
                fi
        elif [ $CH == "5" ]
        then
                PS_LIST=`sudo docker ps -aq`
                PS_ID=`for i in $PS_LIST ; do echo $i ; done`
                echo -e "Showing OFF Container's: \n"
                sudo docker ps
                echo -e "\nWhich Container ID Do You Want To Stop Run?"
                read START
                sudo docker start $START
                if [ $START  == $PS_ID ]
                then
                        echo -e "\nStart Container Successfully $START\n"
                else
                        echo -e "\nContainer ID Not Found: Check Again\n"
                fi
        else
                echo "Enter 1-5 Only !!!"
        echo -e "\n\nDo You want To Exit?    yes/no  y/n "
        read EXIT
        if [ $EXIT == "y" ] || [ $EXIT == "yes" ] || [ $EXIT == "Yes" ] || [ $EXIT == "Y" ]
        then
                break
        fi
        fi
done