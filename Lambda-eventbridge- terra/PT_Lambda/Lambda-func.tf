# Lambda Function
resource "aws_lambda_function" "cronJob" {
  #count         = var.php_app == "hello function" ? 1 : 0 
  function_name    = var.func_name       #"my-php-cron-lambda ${count.index}"
  filename         = var.local_file_path #"function.zip"
  source_code_hash = filebase64sha256("function.zip")
  runtime          = var.runtimeversion

  handler = var.handlerLambda
  role    = aws_iam_role.iam-role.arn

}



