# Creating Web-Server-Container with Specified Image and Port (Such as Nginx, Jenkins, adejonge, Apache2)

#!/bin/bash
H=`hostname -I | awk '{print $1}'`
echo -e "Option: (Such as  Nginx, Jenkins, Apache, adejonge/helloworld)\nEnter Image Name of The List:"
read imageweb
echo -e "\nEnter Port: "
read PORT
echo -e "How Much Container Type: $imageweb Do You Want?"
read NUM
for i in `seq $((NUM+0))`
do
	Z=`sudo docker search $imageweb | awk 'NR==2 {print $1}'`
        if [ $Z == "jenkins" ] || [ $Z == "nginx" ] || [ $Z == "adejonge/helloworld" ] || [ $Z == "apache2" ]
        then
                if [ $Z == "jenkins" ]
		then
                sudo docker pull $Z | grep Status: | awk 'NR==1'
                sudo docker run -d -p $PORT:8080 $Z:latest
                wget http://$H:$PORT
        elif [ $Z == "nginx" ] || [ $Z == "adejonge/helloworld" ]
        then
                sudo docker pull $Z | grep Status: | awk 'NR==1'
                sudo docker run -d -p $PORT:80 $Z:latest
                wget http://$H:$PORT
        elif [ $Z == "apache2" ]
        then
                sudo docker pull $Z | grep Status: | awk 'NR==1'

                sudo docker run -d -p $PORT:80 $Z:latest
                wget http://$H:$PORT
        elif [ $Z == "apache2" ]
        then
                sudo docker pull $Z | grep Status: | awk 'NR==1'
                sudo docker run -d -p $PORT:80 $Z:latest
                wget http://$H:$PORT
	        fi
        else
        	echo "Image Not Found\nOption: (Such as  Nginx, Jenkins, Apache2, adejonge/helloworld) "
	fi
done

