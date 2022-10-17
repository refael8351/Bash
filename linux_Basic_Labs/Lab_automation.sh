#!/bin/bash

C=`sshpass | awk 'NR==1 {print $1}'`
U="Usage:"
echo "$C"
if [ ${C} == ${U}  ]
then
	echo -e "menu..."
else
    sudo apt-get update -y 2>/dev/null
    sudo apt-get install sshpass -y
    sleep 3
    echo -e "\ndone!\n"
fi

# This script does a very simple test for checking Uses disk space.

space=`df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -`
alertvalue="80"

if [ "$space" -ge "$alertvalue" ]; then
    echo -e "At least one of my disks is nearly full!\n$alertvalue"
else
    echo -e "Disk space normal\n$alertvalue"
fi
