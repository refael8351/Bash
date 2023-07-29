#!/bin/bash


# Install NSMP on The Remote Linux Mashine ( Red-Hat / CentOS )
# sudo yum install net-snmp -y

# Install NSMP on The Remote Linux Mashine ( Debian / Ubuntu )
sudo apt-get install snmpd libsnmp-dev -y

sudo cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.bak
sudo sh -c "echo 'rocommunity Str0ngC0mmunity 10.25.5.12' > /etc/snmp/snmpd.conf"

sudo systemctl restart snmpd.service
sudo systemctl enable snmpd.service
cd /usr/local/nagios/libexec
echo -e "\nEnter a IP Addrees of Main Server NagiosXI:\n"
read IP
./check_snmp_storage.pl -H $IP -C Str0ngC0mmunity -m "^/$" -w 2 -c 4


sudo cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.bak
sudo systemctl stop snmpd.service
sudo sh -c "echo '' > /etc/snmp/snmpd.conf"
sudo net-snmp-create-v3-user -ro -a SHA -A Str0ng@uth3ntic@ti0n -x AES -X Str0ngPriv@cy nagios
sudo systemctl start snmpd.service

sudo ufw allow snmp
sudo ufw reload















