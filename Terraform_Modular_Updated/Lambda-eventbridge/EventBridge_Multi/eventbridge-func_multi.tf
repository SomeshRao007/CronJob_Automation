resource "aws_cloudwatch_event_rule" "phpCronR" {
  for_each            = { for job in var.cron_jobs : job.name => job }
  name                = each.value.name
  schedule_expression = each.value.cron_expression
}

resource "aws_cloudwatch_event_target" "phpCronT" {
  for_each = { for job in var.cron_jobs : job.name => job }
  rule     = aws_cloudwatch_event_rule.phpCronR[each.key].name
  arn      = var.target_arn



  input = jsonencode({
    job_name = each.value.job_name  #problem1
    # job_name = "test-job"

  })
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_desync" {
  for_each = { for job in var.cron_jobs : job.name => job }
  statement_id  = "AllowExecutionFromCloudWatch-${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = var.target_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.phpCronR[each.key].arn
}



## NEW

# resource "aws_cloudwatch_event_rule" "phpCronR" {
#   for_each            = { for job in var.cron_jobs : job.name => job }
#   name                = each.value.name
#   schedule_expression = each.value.cron_expression
  
#   event_pattern = jsonencode({
#     source      = ["aws.events"]
#     detail-type = ["Scheduled Event"]
#     detail      = {
#       job_name = [each.value.name]
#     }
#   })
# }

# resource "aws_cloudwatch_event_target" "phpCronT" {
#   for_each = { for job in var.cron_jobs : job.name => job }
#   rule     = aws_cloudwatch_event_rule.phpCronR[each.key].name
#   arn      = var.target_arn
  
#   input_transformer {
#     input_paths = {
#       job_name = "$.detail.job_name"
#     }
#     input_template = jsonencode({
#       job_name = "$.job_name"
#     })
#   }
# }

# resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_desync" {
#   for_each      = { for job in var.cron_jobs : job.name => job }
#   statement_id  = "AllowExecutionFromCloudWatch-${each.key}"
#   action        = "lambda:InvokeFunction"
#   function_name = var.target_function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.phpCronR[each.key].arn
# }