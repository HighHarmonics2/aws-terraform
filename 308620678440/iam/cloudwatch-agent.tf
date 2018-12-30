/* role and policy for admin use with Cloudwatch Agent on EC2 and vi SSM
   creates IAM role Trust Relationship for EC2 service
   attaches AWS Managed Policies for CloudWatchAgentAdminPolicy and AmazonEC2RoleforSSM
   creates instance profile for role
*/

resource "aws_iam_role" "cloudwatch-agent" {
  name                    = "CloudwatchAgentAdmin"
  description             = "CloudWatch agent EC2 install role"
  max_session_duration    = "3600"
  assume_role_policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF

  tags = {
    Environment     = "sbx"
    CreatedBy       = "terraform"
  }
}

######################################################
# will use AWS Managed Policies - no additional policy creation needed

######################################################
# attach policies to cloudwatch-agent role
# allows agent to create and write to log

resource "aws_iam_role_policy_attachment" "attach-cloudwatch-agent-admin" {
  role       = "${aws_iam_role.cloudwatch-agent.name}"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

resource "aws_iam_role_policy_attachment" "attach-cloudwatch-agent-ssm" {
  role       = "${aws_iam_role.cloudwatch-agent.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "cloudwatch-agent-profile" {
  name = "CloudwatchAgentAdminProfile"
  role = "${aws_iam_role.cloudwatch-agent.name}"
}
