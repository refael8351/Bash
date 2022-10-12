from random import randint
from time import sleep
print("Welcome To Our Cube Game\nEach Torn Cost 3 ILS")
monny=int(input("How Much Monny Do You Have? "))
torns=(monny//3)
print("\nYou Have " + str(torns) + " Torns\nYou Have " + str(monny%3) + " ILS Change\n-------------------------------------\nLets Begin The Game ....\n")
sleep(1)

for i in range(torns):
    print("Round Number: " + str(i+1) + "\n-------------------------------\n")
    sleep(1)

