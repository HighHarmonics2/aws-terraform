## main.tf  module definition

resource "aws_db_instance"   "my-my" {
  engine		        = "mysql"
  storage_type		  = "standard"
  allocated_storage	= "${var.storage}"
  name			        = "${var.db_name}" # = the database name not the RDS instance
  identifier		    = "${var.RDS_name}"
  instance_class	  = "${var.instance_class}"
  backup_retention_period = "${var.retention}"
  skip_final_snapshot	= true
  username		      = "${var.user}"
  password		      = "${var.pass}"

  vpc_security_group_ids = ["${var.security_group_ids}"]
  publicly_accessible 	= "${var.public}"

}
