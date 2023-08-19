from time import sleep
fibo = []
for i in range(7):
    fibo.append(int(input("Enter a Namber:")))
    if(fibo[i]) != (fibo[i-1])+(fibo[i-2]):
        if(fibo[i]) > (fibo[i-1])+(fibo[i-2]) or (fibo[i]) < (fibo[i-1]+fibo[i-2]):
            x = (fibo[i-1])+(fibo[i-2])
            y = (fibo[i])
            fibo[i] = x
            print(fibo[i])
            print(fibo[i-1])
            print(fibo[i-2])
            sleep(2)
            print("\n")
            print("Change Fibo List Successfully\nNow It's a Fibo List!")
    else:
        print("It's is a Fibo List")