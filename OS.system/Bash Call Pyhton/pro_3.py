#!/bin/python3

import os
from random import randint
from time import sleep

def randomal():
        for i in range(1,8):
                C1=randint(1,10)
                C2=randint(1,10)
                print("\ncube1:" , C1 , "\nCube2:" , C2)
                if (C1 != C2):
                        print("\n\tIts Is'nt equal ")
                else:
                        print("\n\tWell Done You are champion !!")
randomal()
