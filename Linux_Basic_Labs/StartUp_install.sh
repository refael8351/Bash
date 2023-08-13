# Only For Ubuntu Distribution
#!/bin/bash

sudo apt-get update
echo -e "\ninstall Recommented Service...\n\n\n"
while true
do
	read -p "Menu:\n1.SSH\n2.Networking-Tools\n3.Python3\n4.Docker\n" i
        if [ $i == "1" ]
        then
                sudo apt install ssh -y
		sudo apt install ssh-pass -y
                echo -e "\n\n         <<  Done!  >> "
		break
        elif [ $i == "2" ]
        then
		sudo apt install net-tools -y
		sudo apt install wget -y
		sudo apt install curl -y
		sudo apt install tcpdump -y
                echo -e "\n\n         <<  Done!  >> "
		break
        elif [ $i == "3" ]
        then
		echo -e "\n\ninstallation of Python3 + pip Start...\n\n"
                sudo apt install python3 -y
		sudo apt install python3-pip -y
                echo -e "\n\n         <<  Done!  >> "
		break
        elif [ $i == "4" ]
        then
		#docker installation
		Version=`docker --version | awk '{print $1}'`
		if [ $Version == "Docker" ]
			echo "Docker is Installed on Your Mashine..\n\n"
			continue
		else
		 	directory=`pwd`
			echo -e "\nInstall Docker on the system\n"
			sudo apt-get update -y
			sudo apt-get curl -y
			sudo curl -fSsl https://get.docker.com -o $directory/Docker.sh
			sudo chmod +x $directory/Docker.sh
			sleep 3
			bash $directory/Docker.sh
			echo -e "\n\n         <<  Done!  >> "
		fi
		break
        fi
done


