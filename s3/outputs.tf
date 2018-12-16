output "dynamo.table_arn" {
  value = "${data.terraform_remote_state.dynamoDB.table_arn}"
}

output "dynamo.table_id" {
  value = "${data.terraform_remote_state.dynamoDB.table_id}"
}

output "dynamo.myList" {
  value = "${data.terraform_remote_state.dynamoDB.myList}"
}

