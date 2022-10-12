import pyzipper


def Zipper(file, password):
    try:
        file.extractall(pwd=password.encode())
        return password
    except RuntimeError:
        pass
User=input("Enter a User-Name: ")
Password=input("Enter a Password: ")
Zipper(User, Password)