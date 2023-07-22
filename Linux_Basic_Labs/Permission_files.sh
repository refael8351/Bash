#!/bin/bash

# Permission For New File By Option Num ( Scale 400 - 777 )

pwd=`pwd`
echo -e "Enter a Name of New File + ending-code: "
read FILE
while true
do
echo -e "\nSelect Permission Number: "
read PERMISSION
if ((number >= 400 && number <= 777))
then
        echo "error: Valid number" >&2; exit 1
        sleep 2
        continue
else
        touch $FILE
        sudo chmod $PERMISSION $FILE 2>/dev/null
        find $pwd/$FILE
        echo -e "\nDone Successfully..\n"
        break
fi
done
