#!/bin/python3
import os
from time import sleep
from random import randint
from all_in_one import *

while "True":
	x = input("Here Your Option:\n1.Full Details\n2.Count To 200\n3.Random Cube\n4.Create tgz File\n5.Add 2 Sudo Users ")
	if (x == "1"):
		details()
	elif (x == "2"):
		count()
	elif (x == "3"):
		randomal()
	elif (x == "4"):
		files()
	elif (x == "5"):
		users()
	else:
		print("\nEnter 1-5 Only !!")
		sleep(1)
