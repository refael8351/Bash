#!/bin/python3

import paramiko
import sys

print(sys.argv[1])
nbytes = 4096
hostname = '127.0.0.1'
port = 22
username = 'refael'
password = 'rootroot'
command = '''
echo {} > /home/refael/Desktop/Connection_ssh/info.txt'''.format(sys.argv[1])

client = paramiko.Transport((hostname, port))
client.connect(username=username, password=password)

stdout_data = []
stderr_data = []

session = client.open_channel(kind='session')
session.exec_command(command)

session.close()
client.close()
