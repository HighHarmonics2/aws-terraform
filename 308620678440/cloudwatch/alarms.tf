/* note that dimensions is optional but is required to have the alarm
linked to the specific instance
*/


resource "aws_cloudwatch_metric_alarm" "rds-low-cpu" {
  alarm_name                = "rds-tf-iac-low-cpu"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "3"
  datapoints_to_alarm       = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = "900"
  statistic                 = "Average"
  threshold                 = "2"
  alarm_description         = "Low avg CPU"
  insufficient_data_actions = []

  dimensions {
    DBInstanceIdentifier    = "tf-iac"
  }

  alarm_actions     = ["arn:aws:sns:us-west-2:308620678440:LearningTopic"]
}
