import json
import os
import boto3

def load_cron_jobs():
    cron_jobs_path = os.environ.get('CRON_JOBS_PATH', "/var/task/cron_jobs.json")
    try:
        with open(cron_jobs_path, 'r') as f:
            return json.load(f)['jobs']
    except Exception as e:
        print(f"Error loading cron jobs: {str(e)}")
        return []

cron_jobs = load_cron_jobs()

def lambda_handler(event, context):
    print(f"Received event: {json.dumps(event)}")
    print(f"Available jobs: {json.dumps(cron_jobs)}")
    
    # Check if the event is from CloudWatch Events
    if 'source' in event and event['source'] == 'aws.events':
        # Extract job_name from CloudWatch event detail
        job_name = event.get('detail', {}).get('job_name')
    else:
        # Extract job_name from direct invocation
        job_name = event.get('job_name')
    
    if not job_name and cron_jobs:
        # Fallback: Use the first job in the list if no job name is provided
        print("No job name provided. Using the first available job as fallback.")
        job_name = cron_jobs[0]['name']
    
    if not job_name:
        return {
            'statusCode': 400,
            'body': json.dumps("No job name provided in the event and no fallback available")
        }
    

    print(f"Processing job: {job_name}")
    
    matching_jobs = [job for job in cron_jobs if job['name'] == job_name]
    if not matching_jobs:
        return {
            'statusCode': 400,
            'body': json.dumps(f"No matching job found for {job_name}")
        }
    
    cron_job = matching_jobs[0]
    php_cron_command = cron_job['command']
    
    # Combine the commands
    full_command = f'{log_execution_command}; {php_cron_command} >> /var/log/cron.log 2>&1'


    ssm_client = boto3.client('ssm')
    try:
        response = ssm_client.send_command(
            InstanceIds=["i-03c29cca4ae36ed86"],  # var.EC2-Instance-ID
            DocumentName= "AWS-RunShellScript",  #var.SSM_DocumentName
            Parameters={'commands': [full_command]}
        )
        return {
            'statusCode': 200,
            'body': json.dumps(response, default=str)
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error executing command: {str(e)}")
        }
