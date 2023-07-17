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
