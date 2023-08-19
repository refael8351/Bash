#!/usr/bin/env bash
#    Lab_2
# 1. Download images of dockerui  + nginx
# 2. Creating Container from nginx and specified Port for each Container (Using Func)
#    and Print Output of IP address of each Container.
# 3. Create Container of dockerui and Check in Browser if it's working good and save IP address to log file
# 4. Create Directory named web/ and index.html File inside (add media from any url)
#    Create 2 Container-nginx + mount to /web Folder and Check if waht inside match to the HTML file

EXIT="no"
while true
do
	echo -e "\nMenu:\n1. Pull images of dockerui  + nginx\n2. Creating Container's nginx and specified Port and Print IP address\n3. Create Container dockerui and Check in Browser if it's working good and save IP address to log file\n4. Create Directory named web and index.html and Create 2 Container-nginx + mount to /web folder and DubbleCheck\n"
	read CH
	if [ $CH == "1" ]
	then
		echo -e "\nPulling images...\n"
		sleep 1.5
		sudo docker search dockerui | awk 'NR==2 {print $1}'
		sudo docker pull abh1nav/dockerui:latest
		sudo docker search nginx | awk 'NR==2 {print $1}'
		sudo docker pull nginx:latest
	elif [ $CH == "2" ]
	then
		echo -e "Now nginx:\nHow Many Containers-nginx Do You Want setup? "
		read num
		for i in `seq $((num+0))`
		do
			echo $i
			echo -e "Enter a Name: "
		        read NAME
        		echo -e "Witch Port You Specified For The nginx Container? "
        		read PORT
        		sudo docker run -itd -p $PORT:80 --name $NAME nginx:latest
        		ID=`sudo docker ps | grep $NAME | awk '{print $1}'`
        		sudo docker inspect $ID | grep IPAddress
        		echo "Wait Please!\n"
       			sleep 3
		done

		echo "Done"

	elif [ $CH == "3" ]
	then
		echo -e "Enter a Name For DockerUI Container: "
		read NAMEUI
		echo -e "Select a Port For DockerUI Container: "
		read PORTUI
		sudo docker run -d -p $PORTUI:9000 -v /var/run/docker.sock:/docker.sock --name dockerui_$NAMEUI abh1nav/dockerui:latest -e="/docker.sock"
		ID=`sudo docker ps | grep dockerui_$NAMEUI | awk '{print $1}'`
		sudo docker inspect $ID | grep IPAddress 1> $NAMEUI_out.log
		sleep 3
	elif [ $CH == "4" ]
	then
		echo -e "Creating a Folder and HTML File ...\n"
		sleep 3
		mkdir web
		cd web/
		touch index.html
		pwd=`pwd`
		echo `wget https://google.com` > $pwd/google.html
		cat google.html
	        echo -e "Enter a Name for Container nginx: "
	        read NAME
        	echo -e "Witch Port You Specified For The nginx Container? "
        	read PORT
        	sudo docker run -d -p $PORT:80 --name $NAME -v /home/ubuntu/web/:/usr/share/nginx/html nginx:latest
        	sleep 3
		sudo docker ps
        	echo "Done!"
	else
		echo -e "\nEnter 1-4 Only !!"
	fi
	echo -e "\nDo You Want To Exit ? y/n"
	read EXIT
	if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
	then
		break
	fi
done