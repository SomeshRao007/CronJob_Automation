# How to use 


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
