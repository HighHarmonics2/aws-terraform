provider "aws" {
  region                  = "${var.aws-region}"
  shared_credentials_file = "${var.awsCredsPath}.aws/credentials"
  profile                 = "jure2"
}
