from time import sleep

CHOOSE=input("MENU:\n1. insert a Number:\n2.insert IP add:\n3.insert DNS entries:\n4.Check if a string is polindrom:\n")
if (CHOOSE)=="1":
    print("The New Number is: " + str((int(input("Enter a Number:")))**3))
elif(CHOOSE=="2"):
    IP=[]
    IP.append(input("Enter IP address: "))
    IP.append(input("Enter IP address: "))
    IP.append(input("Enter IP address: "))
    IP.append(input("Enter IP address: "))
    print("This is The List IP: \n" + str(IP))
elif(CHOOSE=="3"):
    DNS={}
    DNS.update({(input("Enter a URL:")): (input("Enter a IP: "))})
    DNS.update({(input("Enter a URL:")): (input("Enter a IP: "))})
    print("The DNS Dictionary is:" + str(DNS))
elif(CHOOSE=="4"):
    word=(input("Enter a Word: "))
    if (word)==(word[::-1]):
        print("This is Polindrom")
    else:
        print("This is Not Polindrom !!!")
else:
    print("Enter 1 - 4 Only !!!")