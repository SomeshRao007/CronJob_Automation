# Cron Job Automation

### Architecture Diagram 
![CronJob_Automation](https://github.com/user-attachments/assets/8d5e0262-df71-49a2-a317-ce21d3ca9251)


The diagram shows the journey from code development to deployment and monitoring in a cloud environment. It starts with developers pushing code to GitHub, which triggers an automated CI/CD process, and ends with the application running on AWS infrastructure with logging and monitoring in place.


**[Loom Video](https://www.loom.com/share/d917b1df4ee64543ae1c51f73a2c5b43?sid=61e6f489-b448-4bfd-a4a8-14204f77a540)** 



### Development Pipeline:

- **Dev**: Represents the developers working on the codebase.
- **GitHub**: The code repository where developers store and manage their source code.
- **Actions CI**: GitHub Actions, which provides continuous integration and continuous deployment (CI/CD) capabilities.

### AWS Infrastructure:

- **Lambda Function**: An AWS serverless compute service that runs the CronJobs in EC2 in response to events.
- **T3a Backend Instance**: An EC2 instance type, running the main application backend.
- **Cron Jobs**: Scheduled tasks running on the backend instance invoked by lambda.
- **CloudWatch Logs**: AWS service for log collection and monitoring.
- **FluentBit**: A lightweight log processor and forwarder, sending logs to CloudWatch. (uses 0.5Mb ram 0.3% of CPU far better than CW agent)
- **EventBridge Bus rules**: AWS EventBridge for event-driven architectures, for triggering the Lambda function according to the cron expression.
- **SSM role**: AWS Systems Manager role, used for managing the EC2 instance.
- **Terraform**: An infrastructure-as-code tool, represents that the AWS resources are managed using Terraform.


### The workflow appears to be:

Developers push code to GitHub. --> GitHub Actions CI runs automated tests and builds. --> The code is deployed/updated to AWS, potentially triggering a Lambda function.  --> The Lambda function executes cronjobs by interacting with a T3a EC2 instance, which runs the backend application. --> Logs from the backend are collected by FluentBit and sent to CloudWatch Logs for monitoring. --> EventBridge Bus rules trigger Lambda functions based on Cron expression events. --> The entire infrastructure is managed and provisioned using Terraform.



This setup demonstrates a modern, cloud-native approach to application development and deployment, emphasizing automation, scalability, and observability.


## Images 

### CloudWatch

![image](https://github.com/user-attachments/assets/53669976-6eaa-422a-b6d1-045349e35514)


![image](https://github.com/user-attachments/assets/e96b4f2f-c471-4a60-98c6-27a2aaa45504)


### Lambda 

![image](https://github.com/user-attachments/assets/e8bf50a9-54c1-464d-82af-b08ab2e36ce8)


### Event Bridge

![image](https://github.com/user-attachments/assets/5f637ae1-1c5a-466e-8d6e-2e27a64cdf32)


![image](https://github.com/user-attachments/assets/41228175-8e7e-4f2e-94ed-203194e71448)



## How to use 


- Create a file `terraform-Dev.tfvars` by  `touch terraform-Dev.tfvars`
- Add this content by `vi terraform-Dev.tfvars`
- Go to _insert mode_ then copy paste below items

~~~
### S3

ProviderRegion = ""

## Lambda
handlerLambda = ""
runtimeversion = ""
func_name = ""
CRON_JOBS_PATH_ENV = ""
lambda_Zip_output = ""
lambda_Zip_source = ""
lambda_Zip_name = ""
lambda_cronjobsfile_name = ""
lambda_cronjobsfile_path = ""

EC2-Instance-ID = ""
SSM_DocumentName = ""

## EventBridge

# CloudwatcheventruleName = ""
# cronjobExpression = ""

cron_jobs = [
  {
    name            = ""
    cron_expression = ""
    job_name        = ""
  },
  {
    name            = ""
    cron_expression = ""
    job_name        = ""
  },
  {
    name            = ""
    cron_expression = ""
    job_name        = ""
  },
  {
    name            = ""
    cron_expression = ""
    job_name        = ""
  },
  {
    name            = ""
    cron_expression = ""
    job_name        = ""
  }
.
.
.
]

### CloudWatch

Log_Group_Name = ""
retention_time_in_days = ""
# Log_Stream_CronLogs = ""
# Log_Stream_CronAppLogs = ""
# Log_Stream_CronErrorLogs = ""
# Log_Stream_CPU = ""

~~~

create backend-dev.config file by `touch backend-dev.config`
then `vi backend-dev.config`

In this `backend-dev.config` file describe state file configuration

~~~
    bucket  = ""
    region  = ""
    key     = ""
    encrypt = true
~~~

there after:

~~~
terraform init -backend-config=backend-dev.config

terraform fmt && terrafrom validate

terraform apply -var-file="terraform_DEV.tfvars" -auto-approve

~~~

to delete all the resopurces every thing:

~~~
terraform destroy --auto-approve
~~~
