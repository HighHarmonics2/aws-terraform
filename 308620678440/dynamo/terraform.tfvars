/* includes a terragrunt block, which configures terragrunt
it can also have other variables for terraform
*/

terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket    = "ju-terraform-state"
      key       = "terraform.dynamo.tfstate"
      region    = "us-west-2"
      encrypt   = true
      dynamodb_table	= "terragrunt-locks"
    }
  }
}
