#!/bin/bash

# This Script Checking if ssh-pass is installed on the sys, if not apt-installation will Start

EXIT="no"
while [ "1" == "1" ]
do
        echo -e "\n\tHere Your Option:\n\t1.Check SSH_pass installed\n\t2.Check Network Connection possibility\n\t3.\n\t4.\n\t5. "
        read CH
        if [ $CH == "1" ]
        then
                check=`sshpass | awk 'NR==1 {print $1}'`
                Value="Usage:"
                if [ ${check} == ${Value} ]; then
                        sleep 1
                        echo -e "SSH-Pass Already install on The system\nBack To Menu"
                        sleep 2
                        continue
                else
                        echo -e "\ninstalling SSH-Pass Right now..\n"
                        sudo apt-get update -y
                        sudo apt-get install sshpass -y
                        sleep 3
                        echo -e "\n\t\tSuccessfull!\n\t\tBack To Menu\n"
                        sleep 2
                fi
        elif [ $CH == "2" ]
        then
                echo -e "\nChecking For Response From Network...\n"
                c=`ping -c1 8.8.8.8 | awk 'NR==5 {print $6}' | cut -d "%" -f1`
                if [ "$c" == "0" ]
                then
                        echo -e "Your Connection To Network is Good...\n"
                        continue
                else
                        echo -e "\n\nYour Network is Unreachable...\nNow we try to Make it Work\nPlease Wait..."
                        sudo service networkd-dispatcher restart
                        ping -c3 8.8.8.8
                fi
        elif [ $CH == "3" ]
        then
                echo "3"
        elif [ $CH == "4" ]
        then
                echo "4"
        elif [ $CH == "5" ]
        then
                echo "5"
        else
                echo -e "Enter 1-5 Only !!\n"
                continue
        fi
        echo "Do You Want To Exit? "
        read EXIT
        if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
        then
                echo -e "Bye Bye .."
                break
        fi
done
