/* includes a terragrunt block, which configures terragrunt
*/

terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket    	    = "ju-terraform-state"
      key       	    = "terraform.cloudwatch.tfstate"
      region    	    = "us-west-2"
      encrypt   	    = true
      dynamodb_table	= "terragrunt-locks"
    }
  }
}
