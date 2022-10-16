
from time import sleep
import boto3
def create_instance():
        ec2 = boto3.resource('ec2')
        instances = ec2.create_instances(
                ImageId=input("\nEnter Image ID: "),
                MinCount=1,
                MaxCount=int(input("Enter How Much instances Do You Want To Setup?\n")),
                InstanceType='t2.micro',
                KeyName='refael.pem'
        )
def stop_instance():
        instances=input("Enter ID's of Exited instances to Stop: ")
        ids = [instances]
        ec2 = boto3.resource('ec2')
        ec2.instances.folter(InstanceIds = ids).stop()

def start_instance():
        instances=input("Enter ID's of Exited instances to Start: ")
        ids = [instances]
        ec2 = boto3.resource('ec2')
        ec2.instances.filter(InstanceIds = ids).start()

def kill_instance():
        instances=input("Enter ID's of Exited instances to Kill: ")
        ids = [instances]
        ec2 = boto3.resource('ec2')
        ec2.instances.filter(InstanceIds = ids).terminate()

def describe_instance():
        client = boto3.client('ec2')
        response = client.describe_instances()
        for r in response['Reservations']:
                for i in r['Instances']:
                        print("\nID: " + i['InstanceId'] + "\nIP Address: " + i['PublicIpAddress'] + "\n-----------------------------\n")
def menu():
        while("true"):
                ch=input("Menu:\n1.Describe EC2\n2.Create EC2\n3.Start EC2\n4.Stop EC2\n5.Kill EC2\n")
                if ch == "1":
                        print("Show infomation About Exited EC2 Instances ID+IP \n")
                        sleep (3)
                        describe_instance()
                elif ch == "2":
                        create_instance()
                elif ch == "3":
                        start_instance()
                elif ch == "4":
                        stop_instance()
                elif ch == "5":
                        kill_instance()
                else:
                        print("\nEnter 1-5 Only !!!\n")
                        sleep (3)
                        continue
