# Download image By Choice
# Creating WEB-Container With Specific imgae + Port
# Check Status of html file on The Container with wget/curl

#!/bin/bash

EXIT="no"
while [ "True" ]
do
	sleep 1.5
	echo -e "\n\t<Menu>\n1.Download image By Choice\n2.Creating WEB-Container With Specific imgae + Port\n3.Check Status of html file on The Container with wget/curl \n"
	read CH
	if [ $CH == "1" ]
	then
		echo -e "\nEnter a Name of image: "
		read image
		X=`sudo docker search $image | awk 'NR==2 {print $1}'`
		if [ $X == $? ]
		then
			sudo docker pull $X
		else
			echo "Bad choice choose again: "
		fi
	elif [ $CH == "2" ]
	then
		echo -e "Enter a Name of image:  'jenkins'/'nginx'/'apache2'/'aedjonge/helloworld'"
		read imageweb
		echo -e "\nEnter Port: "
		read PORT
		echo -e "How Much Container Type: $imageweb ?"
		read NUM
		for i in `seq $((NUM+0))`
		do
			Z=`sudo docker search $imageweb | awk 'NR==2 {print $1}'`
			if [ $Z == "jenkins" ] || [ $Z == "nginx" ] || [ $Z == "adejonge/helloworld" ] || [ $Z == "apache" ]
			then
				if [ $Z == "jenkins" ]
				then
					sudo dockerpuul $Z
					sudo docker run -d -p $PORT:8080 $Z:latest
					wget http://3.22.171.145:$PORT
				elif [ $Z == "nginx" ] || [ $Z == "adejonge/helloworld" ] || $Z == "apache" ]
				then
					sudo docker pull $Z
					sudo docker run -d -p $PORT:80 $Z:latest
					wget http://3.22.171.145:$PORT
				fi
			else
				echo "Enter Good WEB-Server of the Option: "
			fi
		done
	elif [ $CH == "3" ]
	then
#		echo -e "Enter IP of The Host: "
#		read IPHOST
#		wget http://18.188.93.246:8351
		break
	else
		echo "Enter 1-3 Only !!!"
	echo -e "Do You want To Exit? y/n"
	read EXIT
	if [ $EXIT == "y" ] || [ $EXIT == "yes" ] || [ $EXIT == "Yes" ] || [ $EXIT == "Y" ]
	then
		break
	fi
	fi

done

