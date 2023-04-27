# Warning! Run This on Same Directory as The DockerFile For Nginx There To Building Process Successfully
# Step 1: Build image From DockerFile For Nginx
# Step 2: Run Container From This Image
# Step 3: Check if Container Listening To The Port We Specified For The Container in Host
# Step 4: Upload To Docker-Hub 

#!/bin/bash


# Step 1:

pwd=`pwd`
sudo docker images
echo -e "\n---------------------------\nChoose a new Name For Creation Image: "
read tag_name
sudo docker build -t $tag_name . #2>$pwd/docker_log
X=`cat docker_log | grep writing | awk '{print $4}'`
echo "ID: "
echo $X


# Step 2:

echo -e "\n\n------- Dont Use The Port's in The List Below -------\n\n"
sudo netstat -ptuolan | awk '{print $5}'
sleep 2
echo -e "------------------------------------------\n\n\nSelect Port Number: "
read PORT
echo -e "\nEnter Container Name: "
read NAME
sudo docker ps | $image | awk '{print $2}'
sudo docker run -d -p $PORT:80 --name $NAME $tag_name 2>/dev/null
sleep 1
echo -e "\n------------------\nCreate 1 Container Successfully ! \nFor More Info > RUN: docker ps \n\n\n"
ID=`sudo docker ps | grep $NAME | awk '{print $1}'`
IP=`sudo docker inspect $ID | grep IPAddress | awk 'NR==2' |  cut -d '"' -f 4`
GUEST_PORT=`sudo docker ps | grep $NAME | awk '{print $14}' |  cut -d ":" -f 4 | cut -d "-" -f 1`
echo $IP:$GUEST_PORT

# Step 3:


# Step 4:

# 1) Login Docker Hub in One line, but First Insert Your Password in txt File Named > my_password.txt

#echo -e "\n\nEnter User Name: "
#read USERNAME
#cat $pwd/my_password.txt | sudo docker login --username $USERNAME --password-stdin

# 2) Login Docker Hub Manualy
#sudo docker login

# 3) Login Docker Hub Self Hosted
#sudo docker login localhost:8080
