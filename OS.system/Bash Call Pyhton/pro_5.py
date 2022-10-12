#!/bin/python3

import os
from random import randint
from time import sleep

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

users()
