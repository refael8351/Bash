#!/bin/bash

# Show information about System  (( Debian 11 ))


echo "\n\n< System infomation >\n\nIP address: `ip add | grep enp0s3 |awk 'NR==2 {print $2}' | cut -d '/' -f1`"
echo "RAM Memory: `free -h | awk 'NR==2 {print $2}'`"
echo "Availble Storage: `df -h | grep /sda1 | cut -d " " -f13`"
echo "in Used Storage: `df -h | grep /sda1 | cut -d " " -f11`"
echo "Total Storage: `df -h | grep /sda1 | cut -d " " -f9`"
echo "Karnel Version: `uname -r`"
echo "Distribution OS: `cat /etc/*release | grep ID | awk 'NR==2' | cut -d "=" -f 2`\n\n"
