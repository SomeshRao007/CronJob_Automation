# resource "aws_cloudwatch_event_rule" "hello_cron" {
#   name                = "hello-world-cron"
#   schedule_expression =  "cron(0/10 * * * ? *)" #Runs every 10 minutes #"cron(0 6 * * ? *)" # Run at 6:00 AM UTC every day
# }

# # create EventBridge target
# resource "aws_cloudwatch_event_target" "hello_target" {
#   rule      = aws_cloudwatch_event_rule.hello_cron.name
#   arn       = aws_lambda_function.hello_function.arn
#   target_id = "hello-world-lambda-target"
# }

# # allow EventBridge to invoke Lambda function
# resource "aws_lambda_permission" "allow_cloudwatch" {
# #   count         = deploy_to_account == "True" ? 1 : 0  
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.hello_function.function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.hello_cron.arn
# }




# EventBridge Rule
resource "aws_cloudwatch_event_rule" "example" {
  name                = "my-lambda-cron-trigger"
  schedule_expression = "cron(0/2 * * * ? *)" # Replace with your desired cron expression 
}

# EventBridge Target to trigger Lambda
resource "aws_cloudwatch_event_target" "example" {
  rule = aws_cloudwatch_event_rule.example.name
  arn  = aws_lambda_function.example.arn
}

# Allow EventBridge to invoke Lambda
resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_desync" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.example.arn
}