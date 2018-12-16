output "id" {
  value = "${aws_db_instance.my-my.id}"
}

output "endpoint" {
  value = "${aws_db_instance.my-my.endpoint}"
}

output "port" {
  value = "${aws_db_instance.my-my.port}"
}

output "engine_version" {
  value = "${aws_db_instance.my-my.engine_version}"
}

output "maintenance_window" {
  value = "${aws_db_instance.my-my.maintenance_window}"
}
