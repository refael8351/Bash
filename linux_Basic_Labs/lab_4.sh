#!/bin/bash

# 1. Sys info
# 2. Make directory
# 3. sshpass remote
# 4. Service chmod
# 5. Update PC and install recommand packeges
# 6. Kill top Proccess By PID

X="no"
while [ "True" == "True" ]
do
	echo -e "\n<Menu>\n1.Sys info\n2.make directory\n3.sshpass remote\n4.Service chmod\n5.Update PC\n6.Kill top Proccess By PID\n"
	read CH
	if [ $CH == "1" ]
	then
		echo -e "Choose Between Option:\nfor WAN-NET prees 1\nfor LAN-NET press 2\n>"
		read CH1
		if [ $CH1 == "1" ]
		then
			echo -e "ip address wan:`ip add | grep eth0 | awk 'NR==2 {print $2}'`"
			continue
		elif [ $CH1 == "2" ]
		then
			echo -e "ip address lan:`ip add | grep lo | awk 'NR==3 {print $2}'`"
			continue
		else
			echo -e "Enter 1 - 2 Only !!!\n"
		fi

	elif [ $CH == "2" ]
	then
		echo -e "Enter a Folder name:"
		read FOLDER
		mkdir $FOLDER 2>/dev/null
		sleep 2
		cd $FOLDER 2>/dev/null
		pwd
	elif [ $CH == "3" ]
	then
		echo -e "Enter a User Name of Remote Mashine:"
		read USER
		echo -e "Enter a ip address:"
		read IP
		echo -e "Enter a Password:"
		read PASS
		echo -e "Name of File To Create:"
		read FILE
		sshpass -p $PASS ssh $USER@$IP '''
		mkdir try 2>/dev/null
		cd try/ 2>/dev/null
		touch $FILE'''
	elif [ $CH == "4" ]
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
	elif [ $CH == "5" ]
	then
		echo -e "Now we Kill Background Proccess.."
		sleep 3
		for i in `ps aux | grep top | grep T | awk '{print $2}'`; do sudo kill -9 $i ; done
	elif [ $CH == "6" ]
	then
		echo -e "Witch Operation System Do You Using??\n1.DebienOS\n2.UbuntuOS\n3.CantOS\n"
		read SYS
		if [ $SYS == "1" ] || [ $SYS == "2" ]
		then
			sudo apt-get update -y
	                sudo apt-get install python3 -y
			sudo apt-get install awscli -y
                	sudo apt-get install python3-pip -y
                	sudo apt-get install apache2 -y
                	sudo apt-get install git -y
                	sudo apt-get install ssh-pass -y
                	sudo apt-get install net-tools -y
                	sudo apt-get install curl -y
                	sleep 3
		elif [ $SYS == "3" ]
		then
			sudo yum update -y
			sudo yum install python3 -y
			sudo yum install awscli -y
			sudo yum install python3-pip -y
			sudo yum install apache2 -y
			sudo yum install git -y
			sudo yum install nmap -y
			sudo yum install net-tools -y
			sudo yum install curl -y
			sudo yum install
			sleep 3
			echo -e "\nDone..\n"
	else
		echo -e "Enter 1-6 Only !!!"
        	fi
	        echo -e "\nDo You Want To Exit? y/n \n"
	        read X
	        if [ $X == "Yes" ] || [ $X == "yes" ] || [ $X == "y" ] || [ $X == "Y" ]
	        then
		        echo -e "O.K Bye Bye ..."
		        break
	        fi
	fi
done
