#!/bin/bash

# Step 1:
# Build image From DockerFile For Nginx

a="done"
while true
do
        echo -e "# Warning! Run This on Same Directory as The DockerFile To Building Successfully !!!\n\nWarning! Run This on Same Directory as The passwd.txt For access Login !!!"
        sleep 3
        echo -e "\nAre you sure you want to continue (yes/no)? "
        read X
        if [ $X == "yes" ]
        then
                pwd=`pwd`
                sudo docker images
                echo -e "\n---------------------------\nPeek a Name For Creation of The Image: "
                read tag_name
                sudo docker build -t $tag_name . #2>$pwd/docker_log
                X=`cat docker_log | grep writing | awk '{print $4}'`
                echo "Image ID: "
                echo $X
        else
                break
                a="break"
done
if [ $a == "break" ]
then
        echo -e "Failure !!!"
fi
