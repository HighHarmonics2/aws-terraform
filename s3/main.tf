terraform {
  backend "s3" {}
}

data "terraform_remote_state" "dynamoDB" {
  backend    = "s3"
  config {
	bucket = "ju-terraform-state"
	key    = "terraform.dynamo.tfstate"
	region = "us-west-2"
  }
}
