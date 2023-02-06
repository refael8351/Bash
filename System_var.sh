#Apply Only on Ubuntu
#!/bin/bash

IP=`hostname -I | awk '{print $1}'`
OS=`cat /etc/*release | grep "ID" | awk 'NR==2' | cut -d "=" -f2`
RAM_FREE=`free -h | awk 'NR==2 {print $2}'`
RAM_USED=`free -h | awk 'NR==2 {print $3}'`
HOST=`uname -o`
OS_FAMILY=`uname -m`
MODEL=`lscpu | awk 'NR==13 {print $5}'`

echo -e "\nIP Address: $IP\n\nOS System: $OS\n\nRAM in Used: $RAM_USED\t\tFree RAM: $RAM_FREE\n\nHost Name: $HOST\n\nFamily Distribution: $OS_FAMILY\n\nPC Model Type: $MODEL\n\n"
