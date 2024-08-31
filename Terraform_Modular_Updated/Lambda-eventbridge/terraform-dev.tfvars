###S3

ProviderRegion = "us-east-1"


## LAmbda
handlerLambda = "lambda_function.lambda_handler"

runtimeversion = "python3.8"

func_name = "backend_test_cron"

CRON_JOBS_PATH_ENV = "/var/task/cron_jobs.json"

lambda_Zip_output = "temp/lambda_function.zip"
 
lambda_Zip_source = ".github/temp/lambda_function.py"

lambda_Zip_name = "lambda_function.py"

lambda_cronjobsfile_name = "cron_jobs.json"

lambda_cronjobsfile_path = ".github/temp/cron_jobs.json"



## EventBridge

cron_jobs = [
  {
    name            = "publish-scheduled-articles"
    cron_expression = "cron(*/30 * * * ? *)"
    job_name        = "publish-scheduled-articles"
  },
  {
    name            = "update-gtm"
    cron_expression = "cron(0 10 * * ? *)"
    job_name        = "google-analytics4/update-gtm"
  },
  {
    name            = "scheduled-articles"
    cron_expression = "cron(*/30 * * * ? *)"
    job_name        = "scheduled-articles"
  },
  {
    name            = "facebook"
    cron_expression = "cron(30 11 * * ? *)"
    job_name        = "facebook"
  },
  {
    name            = "linkedin"
    cron_expression = "cron(15 6 * * ? *)"
    job_name        = "linkedin"
  },
  {
    name            = "linkedin-update-token"
    cron_expression = "cron(0 2 * * ? *)"
    job_name        = "linkedin/update-token"
  },
  {
    name            = "google-ads"
    cron_expression = "cron(30 10 * * ? *)"
    job_name        = "google-ads"
  },
  {
    name            = "google-analytics4"
    cron_expression = "cron(0 12 * * ? *)"
    job_name        = "google-analytics4"
  },
  {
    name            = "google-analytics4-mainsite"
    cron_expression = "cron(20 12 * * ? *)"
    job_name        = "google-analytics4/mainsite"
  },
  {
    name            = "google-analytics4-location"
    cron_expression = "cron(0 1 * * ? *)"
    job_name        = "google-analytics4/location"
  },
  {
    name            = "powerranking"
    cron_expression = "cron(45 12 * * ? *)"
    job_name        = "powerranking"
  },
  {
    name            = "trending-calculate-points"
    cron_expression = "cron(25 12 * * ? *)"
    job_name        = "trending/calculate-points"
  },
  {
    name            = "youtube"
    cron_expression = "cron(15 4 * * ? *)"
    job_name        = "youtube"
  },
  {
    name            = "youtube-sync"
    cron_expression = "cron(10 4 * * ? *)"
    job_name        = "youtube/sync"
  },
  {
    name            = "youtube-how-to-watch"
    cron_expression = "cron(20 4 * * ? *)"
    job_name        = "youtube/how-to-watch"
  },
  {
    name            = "clearcache-clear"
    cron_expression = "cron(10 6 * * ? *)"
    job_name        = "clearcache/clear"
  },
  {
    name            = "story-remove"
    cron_expression = "cron(0 4 * * 0 ?)"
    job_name        = "story/remove"
  },
  {
    name            = "cover"
    cron_expression = "cron(30 4 * * ? *)"
    job_name        = "cover"
  }
]



