module "lambda_deploy" {
  source          = "./PT_Lambda"
  func_name       = var.func_name
  handlerLambda   = var.handlerLambda
  runtimeversion  = var.runtimeversion
  local_file_path = var.local_file_path
}

module "Eventbridge_deploy" {
  source                  = "./PT_EventBridge"
  CloudwatcheventruleName = var.CloudwatcheventruleName
  cronjobExpression       = var.cronjobExpression
  target_arn              = module.lambda_deploy.lambda_function_arn
  target_function_name    = module.lambda_deploy.lambda_function_name

}
