#!/bin/bash

# Creating User and Give sudo Privilage to New User

for i in `cat /etc/passwd | awk '{print $1}' | cut -d ":" -f1`
do
        echo -e "\n\nEnter New User-Name: "
        read USER
        if [ $i == $USER ]
        then
                echo -e "\n***********************\nUser-Name is Already in Used************************\nPlease Choose Again: "
                sleep 1
                continue
        else
                sudo useradd $USER 2>/dev/null
                sudo usermod -a -G sudo $USER 2>/dev/null
                sleep 1
                echo -e "\n\n"
                id $USER
                echo -e "\nDone Successfully..\n\n"
                break
        fi
done
