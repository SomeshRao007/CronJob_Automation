
variable "target_arn" {
  description = "ARN of the target Lambda function"
  type        = string
}

variable "target_function_name" {
  description = "Name of the target Lambda function"
  type        = string
}

variable "cron_jobs" {
  description = "List of cron jobs with their schedule and job name"
  type = list(object({
    name                = string
    cron_expression     = string
    job_name            = string
  }))
}
