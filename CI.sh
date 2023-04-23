# Warning! Run This on Same Directory as The DockerFile For Nginx There To Building Process Successfully
# Step 1: Build image From DockerFile For Nginx
# Step 2: Run Container From This Image
# Step 3: Check if Container Listening To The Port We Specified For (By wget)
# Step 4: Upload To Docker-Hub 

#!/bin/bash

pwd=`pwd`
echo -e "Choose Name For The Image: \n"
read name
sudo docker build -t $name . 2>$pwd/docker_log
X=`cat docker_log | grep writing | awk '{print $4}'`
echo $X

