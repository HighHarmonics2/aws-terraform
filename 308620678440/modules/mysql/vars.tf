
variable "aws-region" {
  default     = "us-west-2"
}

variable "db_name" {
  description	= "database name" 
}

variable "RDS_name" {
  description	= "RDS name" 
}

variable "instance_class" {
  description   = "instance type for db "
}

variable "storage" {
  description   = "amount of storage in gb" 
}

variable "retention" {
  description   = "retention for snaps in days" 
}

variable "user" {
  description   = "db admin username" 
}

variable "pass" {
  description   = "admin user password"
}

variable "public" {
  description   = "t/f value: is RDS available via internet"
}

variable "security_group_ids" {
  description   = "security group"
  type		= "list"
}