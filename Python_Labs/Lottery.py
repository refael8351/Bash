from random import randint
from time import sleep

print("\nWelcome To 'LOTTERY' Game...")
money = int(input("How Much Monney Do You Have ?? "))
turns = (money//3)
print("You Have " + str(turns) + " Turns\nYour Change is: " + str(money % 3) + " ILS")
price = 0
num1 = 0
num2 = 0
num3 = 0
num4 = 0
num5 = 0
num6 = 0
for i in range(turns):

    list = []

    num1 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    num2 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    num3 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    num4 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    num5 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    num6 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))

    if num1 == (num2 or num3 or num4 or num5 or num6) or num2 == (num3 or num4 or num5 or num6) or num3 == (num4 or num5 or num6) or num4 == (num5 or num6) or (num5 == num6):
        print("Do Not Repeated Numbers Please Enter Again...\n")
        num1 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
        num2 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
        num3 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
        num4 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
        num5 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
        num6 = list.append(int(input("Enter a number Between 1 To 37 Only :\n")))
    print("Rolling... " + str(i + 1))
    sleep(3)
    list1 = []
    num11 = randint(1, 37)
    num12 = randint(1, 37)
    num13 = randint(1, 37)
    num14 = randint(1, 37)
    num15 = randint(1, 37)
    num16 = randint(1, 37)
    list1.append(num11)
    list1.append(num12)
    list1.append(num13)
    list1.append(num14)
    list1.append(num15)
    list1.append(num16)
    if (num1 and num2 and num3 and num4 and num5 and num6) == (num11 and num12 and num13 and num14 and num15 and num16):
        sleep(3)
        print(list)
        print(list1)
        price = price+100000
        print("You Won 1M Dollar!!")
        break
    if (num1 or num2 or num3 or num4 and num5 and num6) == (num11 or num12 or num13 or num14 and num15 and num16) or (num1 or num2 or num3 and num4 and num5 or num6) == (num11 or num12 or num13 and num14 and num15 or num16) or (num1 or num2 and num3 and num4 or num5 or num6) == (num11 or num12 and num13 and num14 or num15 or num16) or (num1 and num2 and num3 or num4 or num5 or num6) == (num11 and num12 and num13 or num14 or num15 or num16) or (num1 or num2 or num3 or num4 and num5 and num6) == (num11 and num12 or num13 and num14 or num15 or num16) or (num1 or num2 and num3 or num4 and num5 or num6) == (num11 or num12 and num13 or num14 and num15 or num16) or (num1 or num2 or num3 and num4 or num5 and num6) == (num11 or num12 or num13 and num14 or num15 and num16) or (num1 and num2 or num3 or num4 and num5 and num6) == (num11 and num12 or num13 or num14 or num15 and num16) or (num1 or num2 and num3 or num4 or num5 and num6) == (num11 or num12 and num13 or num14 or num15 and num16):
        price = price+10
        print("You Won 10 Dollar...!!\n")
    if (num1 or num2 or num3 and num4 and num5 and num6) == (num11 or num12 or num13 and num14 and num15 and num16) or (num1 or num2 and num3 and num4 and num5 or num6) == (num11 or num12 and num13 and num14 and num15 or num16) or (num1 and num2 and num3 and num4 or num5 or num6) == (num11 and num12 and num13 and num14 or num15 or num16) or (num1 and num2 and num3 or num4 and num5 or num6) == (num11 and num12 and num13 or num14 and num15 or num16) or (num1 and num2 and num3 or num4 or num5 and num6) == (num11 and num12 and num13 or num14 or num15 and num16) or (num1 or num2 and num3 or num4 and num5 and num6) == (num11 or num12 and num13 or num14 and num15 and num16) or (num1 or num2 and num3 or num4 and num5 and num6) == (num11 or num12 and num13 or num14 and num15 and num16):
        price = price+100
        print("You Won 100 Dollar ...!!\n")
    if (num1 or num2 and num3 and num4 and num5 and num6) == (num11 or num12 and num13 and num14 and num15 and num16) or (num1 or num2 and num3 and num4 and num5 and num6) == (num11 and num12 or num13 and num14 and num15 and num16) or (num1 and num2 and num3 or num4 and num5 and num6) == (num11 and num12 and num13 or num14 and num15 and num16) or (num1 and num2 and num3 and num4 or num5 and num6) == (num11 and num12 and num13 and num14 or num15 and num16) or (num1 and num2 and num3 and num4 and num5 or num6) == (num11 and num12 and num13 and num14 and num15 or num16):
        price = price+5000
        print("You Won 5000 Dollar ...!!\n")
    else:
        print(list)
        print(list1)
        print("No Luck... Maybe Next Time \n ")
    print("Your Price is: " + str(price))
