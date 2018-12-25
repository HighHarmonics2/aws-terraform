variable "aws-region" {
  default     = "us-west-2"
}

variable "db_pass" {
  description = "mysql admin pass, defined in ENV TF_VAR_db_pass"
}
