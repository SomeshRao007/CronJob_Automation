
## NEW 

resource "aws_lambda_function" "cronJob" {
  function_name    = var.func_name
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = var.runtimeversion
  handler          = var.handlerLambda
  role             = aws_iam_role.iam-role.arn

  environment {
    variables = {
      CRON_JOBS_PATH = var.CRON_JOBS_PATH_ENV
    }
  }
}

# Create a zip file containing both the Lambda function and cron_jobs.json
resource "local_file" "lambda_function_py" {
  content  = file("${path.module}/temp/lambda_function.py")
  filename = "${path.module}/temp/lambda_function.py"
}

resource "local_file" "cron_jobs_json" {
  content  = file("${path.module}/temp/corn_jobs.json")
  filename = "${path.module}/temp/cron_jobs.json"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = var.lambda_Zip_output

  source {
    content  = local_file.lambda_function_py.content
    filename = var.lambda_Zip_name
  }

  source {
    content  = local_file.cron_jobs_json.content
    filename = var.lambda_cronjobsfile_name
  }
}


