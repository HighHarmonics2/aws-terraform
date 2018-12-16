/* includes a terragrunt block, which configures terragrunt
*/

terragrunt = {
  remote_state {
    backend = "s3"
    config {
      profile		= "jure2"
      bucket    	= "ju-terraform-state"
      key       	= "terraform.mysql-iac.tfstate"
      region    	= "us-west-2"
      encrypt   	= true
      dynamodb_table	= "terragrunt-mysql"
    }
  }
}
