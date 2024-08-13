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

#### To check
# execution_id = datetime.now().strftime("%Y%m%d%H%M%S") 
# php_command = f'echo "Execution {execution_id}" >> /tmp/testlogs/cronlogs.txt && /usr/bin/php -q /srv/1851-yii/console/yii scheduled-articles/index >> /tmp/testlogs/cronlogs.txt 2>&1'

php_cron_command = '/usr/bin/php -q /srv/1851-yii/console/yii google-analytics4/location >> /tmp/testlogs/cronlogs.logs 2>&1'

def lambda_handler(event, context):
    ssm_client = boto3.client('ssm')
    response = ssm_client.send_command(
        InstanceIds=['i-02d12df6a406cb28c'],
        DocumentName="AWS-RunShellScript",
        Parameters={'commands': [php_cron_command]}
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