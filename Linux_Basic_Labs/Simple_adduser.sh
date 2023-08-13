#!/bin/bash


echo -e "Enter a New Name:\n"
read USER
sudo useradd -d /home/$USER -s /bin/bash $USER
id $USER
echo -e "\n Add a New User Successfully !!\n"
