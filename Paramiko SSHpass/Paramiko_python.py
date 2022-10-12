#!/bin/python3

import paramiko
import sys

nbytes = 4096
hostname = '192.168.1.1'
port = 22
username = 'refael'
password = 'rootroot'
command = '''	'''

client = paramiko.Transporrt({hostname, port})
client.connect(username=username, password=password)

stdout_data = []
stderr_data = []
session = client.open_channel(kind='session')
session.exec_command(command)

session.close()
client.close()
