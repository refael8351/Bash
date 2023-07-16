#!/bin/bash
# Warning! Run This on Same Directory as The DockerFile For Nginx There To Building Process Successfully
# Warning! Run This on Same Directory as The passwd.txt For access Login

# Step 1: Build image From DockerFile For Nginx
# Step 2: Run 1 Container
# Step 3: Check if Container Listening To The Port We Specified For The Container (wget)
# Step 4: Upload To Docker-Hub, if The Results Success in Every Part Of The CI Proccesses




# Step 1:

pwd=`pwd`
sudo docker images
echo -e "\n---------------------------\nPeek a Name For Creation of The Image: "
read tag_name
sudo docker build -t $tag_name . #2>$pwd/docker_log
X=`cat docker_log | grep writing | awk '{print $4}'`
echo "ID: "
echo $X


# Step 2:

echo -e "\n\n\t\t------- Dont Take The Ports are in Used -------\n\n"
#sudo netstat -ptuolan | awk '{print $5}'
sleep 2
echo -e "------------------------------------------\n\n\nSelect Port Number: "
read PORT
max='^[0-9]+$'
if ! [[ $yournumber =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi
echo -e "\nEnter Container Name: "
read NAME
sudo docker ps | $image | awk '{print $2}'
sudo docker run -d -p $PORT:80 --name $NAME $tag_name 2>/dev/null
sleep 1
echo -e "\n------------------\nCreate 1 Container Successfully ! \nFor More Info > RUN: docker ps \n\n\n"
ID=`sudo docker ps | grep $NAME | awk '{print $1}'`
IP=`sudo docker inspect $ID | grep IPAddress | awk 'NR==2' |  cut -d '"' -f 4`
HOST_PORT=`sudo docker ps | grep $NAME | awk '{print $14}' |  cut -d ":" -f 4 | cut -d "-" -f 1`
echo $IP:$HOST_PORT


# Step 3:  (Next Update is Use TMP Files)

echo -e "Downloading The HTML File in a Few Seconds...\n\n"
wget --spider $IP:$HOST_PORT 1>$pwd/log_wget.txt
result=`grep -r "200" "$pwd/log_wget.txt" | awk '{print $6}'`
if [ $result == "200" ]
then
	echo -e "\n\nPass Successfull\n"
	cat log_wget.txt
else
	echo -e "\n\nError Unknown... Check Manual The Host-Web To Reach Connection"
fi


# Step 4:
# 1) Login Docker Hub in One line, but First Insert Your Password in txt File Named > my_password.txt
# 2) Login Docker Hub Manualy
# 3) Login Docker Hub Self Hosted

while true
do
        echo -e "Witch Type Do You Want To Use ??\n1) Login Auto With PASSWD in txt File\n2) Login Manualy\n3) Login Self Hosted\n\n"
        read CH
        if [ $CH == "1" ]
        then
                echo -e "\n\nEnter User Name: "
                read USERNAME
                cat $pwd/my_password.txt | sudo docker login --username $USERNAME --password-stdin
        elif [ $CH == "2" ]
        then
                sudo docker login
        elif [ $CH == "3" ]
        then
                sudo docker login $IP:$HOST_PORT
        else
                echo -e "\nDo You Want To Exit ?? yes / no \n"
                read EXIT
                if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
                then
                        break
        fi
done

