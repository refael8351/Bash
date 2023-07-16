import requests

response = requests.get(input("Enter a API Address To Expose : "))
output = response.json()['value']
print(output)


def requests_command():
    import requests
    # Put The Output in Object For Better Control

    a = requests.put('url', data={'key': 'value'})
    requests.delete('url')
    requests.head('url')
    requests.options('url')
    requests.post('url', data={'key': 'value'})
    requests.get('url')
    requests.session()
    requests.patch('url')

    b = a.json()['value']
    print(b)
