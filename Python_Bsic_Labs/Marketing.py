print ("Hi, Welcome To Minimarket!\nPlease Make Your Orders\n----------\nProducts Prices:\n-----------\nTomato=3 NIS\nCoucamber=2 NIS\nCola=5 NIS\nChikens=20 NIS\n")
Tomato=int(input("How Much Tomato?"))
Coucamber=int(input("How Much Coucamber?"))
Cola=int(input("How Much Coca Cola?"))
Chikens=int(input("How Much Chikens?"))

print ("\nResulte Of Your Order:\n--------------" + "\nTomato: " + str(Tomato) + "\nCoucamber: " + str(Coucamber) + "\nCola: " + str(Cola) + "\nChikens: " + str(Chikens))

# sum1=Tomato*3
# sum2=Coucamber*2
# sum3=Cola*5
# sum4=Chikens*20
# summry=sum1+sum2+sum3+sum4
sum=(Tomato*2) + (Coucamber*3) + (Cola*5) + (Chikens*20)

print ("\nyou need to pay Without Tax: " + str(sum) + " NIS")
####################################
print ("\nyou need to pay With Tax: " + str(sum*1.17) + " NIS")
print ("\nyou need to pay With Tax: " + str("%.2f" % (sum*1.17)) + " NIS")
