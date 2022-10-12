#!/bin/python3

import os
from random import randint
from time import sleep

def details():
	x=input("Enter Your Name: ")
	y=input("Enter Your Age: ")
	z=input("Enter Your Phone Number: ")
	os.system('echo -e "Your Name is: {} \nYour Age is: {} \nYour Phone number is: {}" > details.txt'.format(x,y,z))

def count():
        for i in range(1,201):
                print(i)
                sleep(0.04)

def randomal():
        for i in range(1,8):
                C1=randint(1,10)
                C2=randint(1,10)
                print("\ncube1:" , C1 , "\nCube2:" , C2)
                if (C1 != C2):
                        print("\n\tIts Is'nt equal ")
                else:
                        print("\n\tWell Done You are champion !!")

def files():
	for i in range(1,11):
		os.system('''
		touch {}.txt
		tar -zcvf refael.tgz {}.txt'''.format(i,i))
	os.system('''ls -la | grep refael.tgz
	tar -xzvf /home/ubuntu/Kickstart/refael.tgz -C .''')

def users():
	a = input("Enter User Name: ")
	b = input("Enter Soucnd User name: ")
	os.system('''
	sudo useradd {}
	sudo usermod -a -G sudo {}
	id {}
	sudo useradd {}
	sudo usermod -a -G sudo {}
	id {}'''.format(a,a,a,b,b,b))


