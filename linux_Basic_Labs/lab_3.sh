#!/bin/bash

#1. System information
#2. Creating User + Group and Put the User in sudo Group
#3. Create File and Change Permmission to The File
#4. Create tgz file and Commpress inside (10 txt Files)
#5. service Change Mode (Up/Down/Restart)

DONE="" 2>/dev/null
EXIT="no" 2>/dev/null
while [ "True" == "True" ]
do
	echo -e "<< Menu >>\n1.System infomation\n2. Creating User + Group and Put the User in sudo Group\n3. Create File and Change Permmission to The File\nCreate tgz file and Commpress inside (10 txt Files)\nservice Change Mode (Up/Down/Restart)\n6.sshpass Remote\n"
	read CH
	if [ $CH == "1" ]
	then
		lscpu | awk 'NR==13'
		uname -a | awk '{print $4}' |cut -d "~" -f2
		free -h | awk 'NR==2 {print $2}'
		echo -e "\n\n"
		netstat -tupln
		echo -e "\n\nip address: `ip add | grep eth0 | awk 'NR==2 {print $2}'`"
		break
	elif [ $CH == "2" ]
	then
		echo -e "Enter a User Name: "
		read USER
		echo -e "Enter a Group Name: "
		read GROUP
		sudo useradd $USER 2>/dev/null
		sudo groupadd $GROUP 2>/dev/null
		sudo usermod -a -G sudo $USER 2>/dev/null
		id $USER
		DONE+=" < Added New User Called: $USER ... and New Group Called: $GROUP > "
	elif [ $CH == "3" ]
	then
		echo -e "Enter a Name of File To Create: "
		read FILE
		touch $FILE.txt
		sudo chmod 777 $FILE.txt 2>/dev/null
		DONE+=" < Permission to New File Called: $FILE > " 
		find ./$FILE.txt 2>/dev/null
	elif [ $CH == "4" ]
	then
		echo -e "Enter a Name for the tgz file: "
		read TGZ
		for i in {1..5} ; do touch $i ; tar -zcvf $TGZ.tgz $i 2>/dev/null ; done
		sleep 3
		ls -l | grep $TGZ.tgz
		DONE+=" < Added New File Called: $TGZ.tgz > "
        elif [ $CH == "5" ]
        then
                echo -e "Enter a Service Name For Change Status:"
                read SERVICE
                echo -e "Press 1  > for Shutdown\nPress 2 > for Startup\nPress 3 > for Restart\n\t:"
                read STATUS
                if [ $STATUS == "1" ]
                then
                        sudo service $SERVICE stop 2>/dev/null
                        sleep 3
                        echo -e "\nDone..\n"
                elif [ $STATUS == "2" ]
                then
                        sudo service $SERVICE start 2>/dev/null
                        sleep 3
                        echo -e "\nDone..\n"
                elif [ $STATUS == "3" ]
                then
                        sudo service $SERVICE restart 2>/dev/null
                        sleep 3
                        echo -e "\nDone..\n"
                fi
	else
		echo "Enter 1-5 Only !!!"
		sleep 2
	fi
	echo -e "$DONE"
        read EXIT
        if [ $EXIT == "Yes" ] || [ $EXIT == "yes" ] || [ $EXIT == "y" ] || [ $EXIT == "Y" ]
        then
                echo -e "O.K Bye Bye ..."
                break
        fi
done

