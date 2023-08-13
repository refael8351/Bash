#!/bin/bash

group="sudo"
read -p> "Set new sudo user's name (Please try to avoid admin or administrator, some hosts have these reserved): " new_sudo_user_name
if [ -z "$(getent passwd $new_sudo_user_name)" ]; then
        echo "user does NOT exist."
else
        echo "user DOES exist."
fi

echo "Please enter the new password:"
read password1
echo "Please repeat the new password:"
read password2

if [ $password1 != $password2 ]; then
        echo "Passwords do not match"
        exit
fi

sudo su -c "useradd $new_sudo_user_name -s /bin/bash -m -aG $group"
