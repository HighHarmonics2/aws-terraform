terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket    = "ju-terraform-state"
      key       = "terraform.vpc.tfstate"
      region    = "us-west-2"
      encrypt   = true
      dynamodb_table	= "terragrunt-locks"
    }
  }
}
