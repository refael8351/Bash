#!/bin/bash

# Show information about System  (( Ubuntu_18.04 / 20.04 / 22.04 ))


echo -e "\n\n< System infomation >\n\nIP address: `ip add | grep eth0 |awk 'NR==2 {print $2}'`"
echo -e "RAM Memory: `free -h | awk 'NR==2 {print $2}'`"
echo -e "Storage Used: `df -h | grep /sda1`"
echo -e "Storage Total: `df -h | grep /$ | awk '{print $2}'`"
echo -e "Karnel Version: `uname -r`"
echo -e "OS: `cat /etc/*release | grep ID | awk 'NR==1' | cut -d "=" -f 2` `cat /etc/*release | grep VERSION | awk 'NR==1' | cut -d " " -f 2`"
echo -e " Core Per Socket: `lscpu | awk 'NR==4'`"
