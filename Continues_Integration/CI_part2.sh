#!/bin/bash
# Simple CI Process ( Continues Integration )

# Step 2:
# Run 1 Container

echo -e "\n\n\t\t------- Dont Choose The Port's in Used !!! -------\n\n"
while true
do
        sleep 2
        echo -e "------------------------------------------\n\n\nSelect Port Number: "
        read PORT
        max='^[0-9]+$'
        if ! [[ $PORT =~ $max ]] ; then
                echo "error: Not a number" >&2; exit 1
                continue
        else
                break
        fi
done
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


# Step 3:  
# Check Access To The Container

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


Step 4:
# Login Menu Option 
# Commit and Push From This Live Container

while true
do
        echo -e "\tChoose Your Connection Type Used:\n1) Login Manualy\n2) Login Self Hosted\n\n"
        read CH
        if [ $CH == "1" ]
        then
		echo -e "\nEnter a User Name:\n"
		read USER_D
		echo -e "\nEnter a Password:\n"
		read PASSWORD
                sudo docker login -u $USER_D -p $PASSWORD
		echo -e "Enter a New Name: "
		read COMMIT_NAME
		sudo docker container commit $ID $COMMIT_NAME
		sudo docker image tag $COMMIT_NAME:latest www8351/main
		sudo docker image push www8351/main
        elif [ $CH == "2" ]
        then
		echo -e "\nEnter a User Name:\n"
		read USER_D
		echo -e "\nEnter a Password:\n"
		read PASSWORD
                sudo docker login localhost:8080 -u $USER_D -p $PASSWORD
		echo -e "Enter a New Name: "
		read COMMIT_NAME
		sudo docker container commit $ID $COMMIT_NAME
		sudo docker image tag $COMMIT_NAME:latest $USER_D/main
		sudo docker image push $USER_D/main

        else
                echo -e "\nDo You Want To Exit ?? yes / no \n"
                read EXIT
                if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
                then
                        break
        fi
done


