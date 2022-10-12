# Creating Container of nginx + exec and Change The html file permanence and commit new image From That Container

#!/bin/bash

echo -e "Enter a Name: "
read NAME
echo -e "Witch Port You Specified For The nginx Container? "
read PORT
sudo docker run -d -p $PORT:80 --name $NAME nginx:latest
sudo docker exec -i -t $NAME bash 

