# Lambda Function
resource "aws_lambda_function" "example" {
  function_name    = "my-php-cron-lambda"
  filename         = "function.zip"
  source_code_hash = filebase64sha256("function.zip")
  runtime          = "python3.8" 

  handler = "lambda_function.lambda_handler"
  role    = aws_iam_role.iam-role.arn

}



