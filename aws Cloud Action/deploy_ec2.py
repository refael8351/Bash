import boto3


def create_instance():
    print(
        "\n\t\tCopy ID Image You Want\nUbuntu 18.04 >> ami-0a59f0e26c55590e9\nUbuntu 20.04 >> ami-0d5bf08bc8017c83b\n Ubuntu 22.04 >> ami-097a2df4ac947655f\nDebian 11 >> ami-0c7c4e3c6b4941f0f\n")
    ec2 = boto3.resource('ec2')
    instances = ec2.create_instances(
        ImageId=input("\nEnter Image ID: "),
        MinCount=1,
        MaxCount=int(input("Enter How Much instances Do You Want To Setup?\n")),
        InstanceType='t2.micro',
        KeyName='refael.pem'
    )


create_instance()
