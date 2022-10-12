#!/bin/bash
EXIT="no"
while [ "1" == "1" ]
do
	echo -e "Here Your Option:\n1.Full Details\n2.Count To 200\n3.Random Cube\n4.Create tgz File\n5.Add Super Users "
	read CH
	if [ $CH == "1" ]
	then
		pro_1.py
	elif [ $CH == "2" ]
	then
		pro_2.py
	elif [ $CH == "3" ]
	then
		pro_3.py
	elif [ $CH == "4" ]
	then
		pro_4.py
	elif [ $CH == "5" ]
	then
		pro_5.py
	else
		echo -e "Enter 1-5 Only !!\n"
	fi
	echo "Do You Want To Exit? "
	read EXIT
	if [ $EXIT == "yes" ] || [ $EXIT == "y" ]
	then
		echo -e "Bye Bye .."
		break
	fi
done
