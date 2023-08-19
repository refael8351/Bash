'''
Menu:
1. printing 100 numbers
2. check fibo
3. randint numbers until we get 12 or we count 10 times
'''

from random import randint
from time import sleep
while(True):
    choice=input("Menu:\n--------------\n1. 1 To 100\n2. Fibo\n3. randint_Lucky_Num 12 or count 10 Games\n4. Marketing\n")
    if(choice == "1"):
        for i in range(1,101):
            print(i)
    elif(choice == "2"):
        fibo = []
        for i in range(7):
            fibo.append(int(input("Enter a Namber:")))
            if (fibo[i]) != (fibo[i - 1]) + (fibo[i - 2]):
                if (fibo[i]) > (fibo[i - 1]) + (fibo[i - 2]) or (fibo[i]) < (fibo[i - 1] + fibo[i - 2]):
                    x = (fibo[i - 1]) + (fibo[i - 2])
                    y = (fibo[i])
                    fibo[i] = x
                    print(fibo[i])
                    print(fibo[i - 1])
                    print(fibo[i - 2])
                    sleep(2)
                    print("\n")
                    print("Change Fibo List Successfully\nNow It's a Fibo List!")
            else:
                print("It's is a Fibo List")
    elif(choice == "3"):
        x = 1
        y = randint(1,12)
        while(y!=12 and x<11):
            print("Counter:" + str(x) + "  Number:" + str(y) + "\n")
            x = x+1
            y = randint(1, 12)
    elif (choice=="4"):
        print("Hi, Welcome To Minimarket!\nPlease Make Your Orders\n----------\nProducts Prices:\n-----------\nTomato=3 NIS\nCoucamber=2 NIS\nCola=5 NIS\nChikens=20 NIS\n")
        Tomato = int(input("How Much Tomato?"))
        Coucamber = int(input("How Much Coucamber?"))
        Cola = int(input("How Much Coca Cola?"))
        Chikens = int(input("How Much Chikens?"))

        print("\nResulte Of Your Order:\n--------------" + "\nTomato: " + str(Tomato) + "\nCoucamber: " + str(
            Coucamber) + "\nCola: " + str(Cola) + "\nChikens: " + str(Chikens))

        # sum1=Tomato*3
        # sum2=Coucamber*2
        # sum3=Cola*5
        # sum4=Chikens*20
        # summry=sum1+sum2+sum3+sum4
        sum = (Tomato * 2) + (Coucamber * 3) + (Cola * 5) + (Chikens * 20)

        print("\nyou need to pay Without Tax: " + str(sum) + " NIS")
        ####################################
        print("\nyou need to pay With Tax: " + str(sum * 1.17) + " NIS")
        print("\nyou need to pay With Tax: " + str("%.2f" % (sum * 1.17)) + " NIS")
    else:
        print("Enter 1-3 only!!\n")
        continue
    exit = input("Do you want to exit? yes/no\n")
    if(exit == "yes"):
        print("Thank you and bye bye...\n")
        break