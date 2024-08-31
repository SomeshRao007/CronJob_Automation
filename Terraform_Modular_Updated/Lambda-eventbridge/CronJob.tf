
module "lambda_deploy" {
  source          = "./1851_Backend_legacy_Lambda_Multi"
  func_name       = var.func_name
  handlerLambda   = var.handlerLambda
  runtimeversion  = var.runtimeversion
  CRON_JOBS_PATH_ENV =  var.CRON_JOBS_PATH_ENV
  lambda_cronjobsfile_name = var.lambda_cronjobsfile_name
  lambda_cronjobsfile_path = var.lambda_cronjobsfile_path
  lambda_Zip_name = var.lambda_Zip_name
  lambda_Zip_output = var.lambda_Zip_output
  lambda_Zip_source = var.lambda_Zip_source
}


module "Eventbridge_deploy" {
  source               = "./1851_Backend_legacy_EventBridge_Multi"
  target_arn           = module.lambda_deploy.lambda_function_arn
  target_function_name = module.lambda_deploy.lambda_function_name
  cron_jobs            = var.cron_jobs
}

