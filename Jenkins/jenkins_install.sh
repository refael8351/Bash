#!/bin/bash

# Ubuntu Version 18.04, 20.04, 22.04
# User Runing Must Have Root/sudo Privileges

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y 2>/dev/null
sudo apt-get install ufw -y 2>/dev/null
sudo ufw allow 80 2>/dev/null
sudo apt-get install fontconfig openjdk-11-jre -y 2>/dev/null
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins | awk 'NR==3'
sudo usermod -aG sudo jenkins
echo -e "\n\nYour Password is:\n-------------------------------\n "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sleep 3
echo -e "---------------------------------\n\n\nDone!"
