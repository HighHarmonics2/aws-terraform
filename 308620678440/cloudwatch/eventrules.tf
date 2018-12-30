resource "aws_cloudwatch_event_rule" "ec2-cron" {
  name			= "EC2-stop-cron"
  schedule_expression	= "cron(12 3 * * ? *)"

}

