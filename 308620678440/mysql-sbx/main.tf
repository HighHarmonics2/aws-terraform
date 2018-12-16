# calls the mysql module and sets the variables

terraform {
  backend "s3" {}
}

module "mysql" {
  source = "../modules/mysql"

  db_name 		= "test23"
  instance_class	= "db.t2.micro"
  storage		= 20 # min for free tier
  retention		= 1
  user			= "myadmin"
  pass			= "${var.db_pass}"

  RDS_name		= "tf-iac" #infrastructure as Code
  public		= true
  security_group_ids	= ["sg-06aae946f2ff4db68"]  #  launch-wizard5
}
