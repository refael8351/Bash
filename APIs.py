import requests

response = requests.get(input("Enter a API Address To Expose : "))
output = response.json()['value']
print(output)
