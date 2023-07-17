import boto3
from time import sleep

def stop_instance():
    instances = input("Enter ID's of Exited instances to Stop: ")
    ids = [instances]
    ec2 = boto3.resource('ec2')
    ec2.instances.folter(InstanceIds=ids).stop()


def start_instance():
    instances = input("Enter ID's of Exited instances to Start: ")
    ids = [instances]
    ec2 = boto3.resource('ec2')
    ec2.instances.filter(InstanceIds=ids).start()


def kill_instance():
    instances = input("Enter ID's of Exited instances to Kill: ")
    ids = [instances]
    ec2 = boto3.resource('ec2')
    ec2.instances.filter(InstanceIds=ids).terminate()

def menu():
    while ("true"):
        ch = input("Menu:\n1.Start EC2\n2.Stop EC2\n3.Kill EC2\n")
        if ch == "1":
            start_instance()
        elif ch == "2":
            stop_instance()
        elif ch == "3":
            kill_instance()
        else:
            print("\nEnter 1-3 Only !!!\n")
            sleep(3)
            continue

menu()