from random import randint
from time import sleep

print("\n<Welcome To Campaign Social Media> \n\nFacebook Cost = 100 ILS Per Day\ninstagram Cost = 50 ILS Per Day")
money=int(input("How Much Money Do You Want To invest in total ??"))
facebook=int(input("How Many Day You Want to Campaign run on 'Facebook'?\n"))
instagram=int(input("How Many Day You Want to Campaign run on 'Instagram'?\n"))
SUM1=(facebook*100*1.17)
SUM2=(instagram*50*1.17)
SUM3=SUM2+SUM1
SUM5 = money - (SUM1 + SUM2)
if money<(SUM3):
    sleep(3)
    print("Your Need To Add More: " + str("%.2f" % (SUM5)) + " ILS")
else:
    SUM1 = (facebook * 100 * 1.17)
    SUM2 = (instagram * 50 * 1.17)
    SUM3 = SUM2 + SUM1
    SUM5 = money - (SUM1 + SUM2)
    sleep(3)
    print(SUM5)
    print("You Have " + str(facebook) + " Campaign on Facebook\nRemming Time: " + str(facebook) + " Day Left\n")
    print("You Have " + str(instagram) + " Campaign on instagram\nRemming Time: " + str(instagram) + " Day Left\n")
    print("Your Change is: " + str("%.2f" % (SUM5)) + " ILS\nSuccessfull...Good Job")
