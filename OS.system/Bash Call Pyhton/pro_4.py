#!/bin/python3

import os
from random import randint
from time import sleep


def files():
	for i in range(1,11):
		os.system('''
		touch {}.txt
		tar -zcvf refael.tgz {}.txt'''.format(i,i))
	os.system('''ls -la | grep refael.tgz
	tar -xzvf /home/ubuntu/Kickstart/refael.tgz -C .''')

files()
