#!/bin/bash

connected_passwd() {
echo -e "Enter a User name: "
read USER
echo -e "Enter IP Address: "
read IP
echo "Enter a Password: "
read PASS
sshpass -p $PASS ssh $USER@$IP $1

#sshpass -i $KEY ssh $USER@$IP
#echo -e "Enter Key + Full Path: "
}
