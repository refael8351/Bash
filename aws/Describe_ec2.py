import boto3

def describe_instance():
    client = boto3.client('ec2')
    response = client.describe_instances()
    for r in response['Reservations']:
        for i in r['Instances']:
            print("\nID: " + i['InstanceId'] + "\nPrivate IP Address: " + i[
                'PublicIpAddress'] + "\n-----------------------------\n")
describe_instance()
