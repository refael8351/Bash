#!/bin/bash
# Simple CI Process ( Continues Integration )


# Step 3:  
# Check Access To The Container

echo -e "Downloading The HTML File in a Few Seconds...\n\n"
wget --spider $IP:$HOST_PORT 1>$pwd/log_wget.txt
result=`grep -r "200" "$pwd/log_wget.txt" | awk '{print $6}'`
if [ $result == "200" ]
then
	echo -e "\n\nPass Successfull\n"
	cat log_wget.txt
else
	echo -e "\n\nError Unknown... Check Manual The Host-Web To Reach Connection"
fi

Step 4:
# Login Menu Option 
# Commit and Push To Docker Hub Repository

while true
do
        echo -e "Witch Type Do You Want To Use ??\n1) Login Auto With PASSWD in txt File\n2) Login Manualy\n3) Login Self Hosted\n\n"
        read CH
        if [ $CH == "1" ]
        then
                echo -e "\n\nEnter User Name: "
                read USERNAME
                cat $pwd/my_password.txt | sudo docker login --username $USERNAME --password-stdin
        elif [ $CH == "2" ]
        then
                sudo docker login
        elif [ $CH == "3" ]
        then
                sudo docker login $IP:$HOST_PORT
        else
                echo -e "\nDo You Want To Exit ?? yes / no \n"
                read EXIT
                if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
                then
                        break
        fi
done