import boto3
from time import sleep


def create_instance():
    ec2 = boto3.resource('ec2')
    instances = ec2.create_instances(
        ImageId=input("\nEnter Image ID: "),
        MinCount=1,
        MaxCount=int(input("Enter How Much instances Do You Want To Setup?\n")),
        InstanceType='t2.micro',
        KeyName='refael.pem'
    )