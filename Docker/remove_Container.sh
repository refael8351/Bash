# Delete Container's By Choice
# Warning! Show All Container  ON & OFF

#!/bin/bash

PS_LIST=`sudo docker ps -aq`
PS_ID=`for i in $PS_LIST ; do echo $i ; done`
echo -e "Showing All Container: \n"
sudo docker ps -a
echo -e "\nWhich Container ID Do You Want To Remove?"
read RM
sudo docker rm -f $RM
if [ $RM  == $PS_ID ]
then
        echo -e "\nDeleted Successfull $RM\n"
else
        echo -e "\nContainer ID Not Found: Try Again\n"
fi

