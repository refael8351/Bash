#!/bin/python
from time import sleep
import boto3

X = (input("\nWitch Operation System Do you Want? "))
if X == "ubuntu" or X == "Ubuntu":
	print("OS Version: Ubuntu_18.04")
	ID = 'ami-00978328f54e31526'
elif X == "debian" or X == "Debian":
	print("OS Version: Debian_11")
	ID = 'ami-0c7c4e3c6b4941f0f'
elif X == "Red Hat" or X == "RedHat" or X == "red hat" or X == "redhat":
	print("OS Version: Red Hat_8")
	ID = 'ami-092b43193629811af'
elif X == "windows" or X == "Windows" or X == "Windows Server" or X == "windows server":
	print("OS Version: Microsoft Windows Server 2022")
	ID = 'ami-0321c04d7f279eb63'
else:
	print("\nEnter Good Operation System: \nOption: Ubuntu / RedHat / Debian / Windows")
	sleep(3)
ec2 = boto3.resource('ec2')
instances = ec2.create_instances(
	ImagesId=ID,
	MinCount=1,
	MaxCount=int(input("Enter How Much instances Do You Want To Setup?\n")),
	InstanceType='t2.micro',
	KeyName='refael.pem'
)
