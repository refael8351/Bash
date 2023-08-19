
#
# mylist=["Refael Malka" , 27 , "www8351@gmail.com" , "0505580188"]
# print ("Full Name: " + mylist[0] + "\nAge: " + str(mylist[1]) + "\nMail: " + mylist[2] + "\nPhone Number: " + mylist[3] + "\n" )

print("IP List:")
IP= [ "11.11.11.11" , "22.22.22.22" ]
print(IP)
print("The Lenth Of Entrie is: " + str(len(IP)))
IP.append("33.33.33.33")
IP.append("44.44.44.44")
IP.append("55.55.55.55")
print(IP)
print("The New Update Lenth is: " + str(len(IP)))
IP.pop(-1)
IP.pop(2)
print(IP)
print("The New Lenth is: " + str(len(IP)))
IP.insert(2,"64.64.64.65")
print(IP)
IP[3] = "87.87.78.87"
print(IP)
