#!/bin/bash

# Show information about System  (( Ubuntu_18.04 / 20.04 / 22.04 ))


echo "\n\n< System infomation >\n\nIP address: `hostname -I | awk '{print $2}'`"
echo "RAM Memory: `free -h | awk 'NR==2 {print $2}'`"
echo "Storage Used: `df -h | grep /sda1 | awk '{print $5}'`"
echo "Storage Total: `df -h | grep /$ | awk '{print $2}'`"
echo "Karnel Version: `uname -r`"
echo "Distribution OS: `cat /etc/*release | grep ID | awk 'NR==1' | cut -d "=" -f 2` `cat /etc/*release | grep VERSION | awk 'NR==1' | cut -d " " -f 2`"

