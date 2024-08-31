

variable "ProviderRegion" {
  
  description = "region where u want to deploy code"
  type = string
}


### Lambda 
variable "handlerLambda" {
  type = string
}

variable "runtimeversion" {
  type = string
}

variable "func_name" {
  type = string
}

variable "CRON_JOBS_PATH_ENV" {
  type = string
}

variable "lambda_Zip_output" {
  type = string
}
variable "lambda_Zip_source" {
  type = string
}
variable "lambda_Zip_name" {
  type = string
}

variable "lambda_cronjobsfile_name" {
  type = string
}
variable "lambda_cronjobsfile_path" {
  type = string
}



### EventBridge
variable "cron_jobs" {
  description = "List of cron jobs with their schedule and job name"
  type = list(object({
    name            = string
    cron_expression = string
    job_name        = string
  }))
}
