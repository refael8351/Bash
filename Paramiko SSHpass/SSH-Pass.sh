#!/bin/bash

connection_pass() {
echo -e "Enter a User name: "
read USER
echo -e "Enter IP Address: "
read IP
echo "Enter a Password: "
read PASS
sshpass -p $PASS ssh $USER@$IP $1

#read KEY
#sshpass -i $KEY ssh $USER@$IP
}


EXIT="no"
while [ "1" == "1" ]
do
	echo -e "Enter Your Command:\n1.Creating File\n2.Creating a Folder\n3.Creating a User\n"
	read CH
	if [ $CH == "1" ]
	then
	    echo -e "Enter Name of File: "
	    read FILE
	    echo -e "if You Want To Write in file >>\nif not Just Press Enter >> "
	    read A
		connection_pass "touch /home/ubuntu/$FILE.txt > $A"
	elif [ $CH == "2" ]
	then
	    echo -e "Enter a Folder Name: "
	    read FOLDER
		connection_pass "mkdir /home/ubuntu/$FOLDER"
	elif [ $CH == "3" ]
	then
	    echo -e "Enter User Name: "
	    read USER
		connection_pass "sudo useradd $USER && sudo usermod -a -G sudo $USER && id $USER"
	else
		echo -e "Enter 1-3 Only !!\n"
	fi
	echo "Do You Want To Exit? "
	read EXIT
	if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
	then
		echo -e "Bye Bye .."
		break
	fi
done
