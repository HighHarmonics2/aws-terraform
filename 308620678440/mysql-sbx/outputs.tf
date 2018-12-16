output "dns-name" {
  value = "${module.mysql.endpoint}"
}

output "port" {
  value = "${module.mysql.port}"
}

output "id" {
  value = "${module.mysql.id}"
}

output "engine_version" {
  value = "${module.mysql.engine_version}"
}
