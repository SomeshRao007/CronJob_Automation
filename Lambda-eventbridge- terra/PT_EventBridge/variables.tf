# variable "github_repository" {
#   type = string
# }

# variable "deploy_to_account" {
#   description = "testing out if conditions"
#   type = string
# }

variable "CloudwatcheventruleName" {
  type = string
}

variable "cronjobExpression" {
  type = string
}

variable "target_arn" {
  description = "ARN of the target Lambda function"
  type        = string
}

variable "target_function_name" {
  description = "Name of the target Lambda function"
  type        = string
}