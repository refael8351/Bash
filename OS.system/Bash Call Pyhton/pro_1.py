#!/bin/python3

import os
from random import randint
from time import sleep

def details():
	x=input("Enter Your Name: ")
	y=input("Enter Your Age: ")
	z=input("Enter Your Phone Number: ")
	os.system('echo -e "Your Name is: {} \nYour Age is: {} \nYour Phone number is: {}" > details.txt'.format(x,y,z))
details()

