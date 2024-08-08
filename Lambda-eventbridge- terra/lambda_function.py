import boto3
import json
from datetime import datetime

# def lambda_handler(event, context):
#     ssm_client = boto3.client('ssm')
#     response = ssm_client.send_command(
#         InstanceIds=['i-027cc25a67fe8411a'],
#         DocumentName="AWS-RunShellScript",
#         Parameters={'commands': [
#             'cd /home/ec2-user/hello/',
#             'bash cron-job.sh'
#         ]}
#     )

def lambda_handler(event, context):
    ssm_client = boto3.client('ssm')
    response = ssm_client.send_command(
        InstanceIds=['i-027cc25a67fe8411a'],
        DocumentName="AWS-RunShellScript",
        Parameters={'commands': [
            'cd /home/ec2-user/hello/',
            './cron-job.sh'
        ]}
    )

    def convert_datetime_to_string(obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, list):
            return [convert_datetime_to_string(item) for item in obj]
        elif isinstance(obj, dict):
            return {k: convert_datetime_to_string(v) for k, v in obj.items()}
        else:
            return obj

    converted_response = convert_datetime_to_string(response)

    return {
        'statusCode': 200,
        'body': json.dumps(converted_response) 
    } 