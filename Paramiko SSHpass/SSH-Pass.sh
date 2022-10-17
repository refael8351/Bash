#!/bin/bash

connection_pass() {
echo -e "Enter a User name: "
read USER
echo "Enter a Password: "
read PASS
echo -e "Enter IP Address: "
read IP
sshpass -p $PASS ssh $USER@$IP $1

#read KEY
#sshpass -i $KEY ssh $USER@$IP
}

DONE=""
EXIT="no"
while true
do
	echo -e "Enter Your Command:\n1.Creating File\n2.Creating a Folder\n3.Creating a User\n"
	read CH
	if [ $CH == "1" ]
	then
	    echo -e "Enter Name of File: "
	    read FILE
	    echo -e "if You Want To Write in file >>\nif not Just Press Enter >> "
	    read A
		connection_pass "touch /home/refael/Desktop/Connection_ssh/$FILE.txt"
		DONE+="Added New File Called $FILE.txt"
	elif [ $CH == "2" ]
	then
	    echo -e "Enter a Folder Name: "
	    read FOLDER
		connection_pass "mkdir /home/refael/Desktop/Connection_ssh/$FOLDER"
		DONE+="Added New Folder Called $FOLDER"
	elif [ $CH == "3" ]
	then
	    echo -e "Enter User Name: "
	    read USER
		connection_pass "sudo useradd $USER && sudo usermod -a -G sudo $USER && id $USER"
		DONE+="Added New User Called $USER"
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
echo -e "$DONE"
echo -e "\n-----------------------------------\nPython Now...\n"
python3 Paramiko_python.py "$DONE"
