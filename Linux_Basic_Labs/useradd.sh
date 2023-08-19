#!/bin/bash
# Creating New User With No Sudo Previleges
# Double Checking on User-Name if it's Exist and Check if Password`s is Equal

read -p "Set new user..... Enter a Name: (Please Try To Avoid admin or administrator): " user_name
if [ -z "$(getent passwd $user_name)" ]
then
        echo "user DOES NOT exist."
        echo "Please enter the new password:"
        read password1
        echo "Please repeat the new password:"
        read password2
        if [ $password1 != $password2 ]
        then
                echo "\nPasswords do not match\n"
                exit
                echo "\nCancel Useradd Proccess"
                sleep 2
                echo "\nDone..\nStatus: Failed !!"
        fi
        sudo useradd -d /home/$user_name --create-home -p $password1 $user_name
        id $user_name
        mkdir /home/$user_name/ 2>/dev/null
        cd /home/$user_name/
        echo "New User in System...Welcome" | cat > info.txt
        cat info.txt
else
        echo "\nThe User-Name Already in Used\nDone..\nStatus: Failed !!"
fi

