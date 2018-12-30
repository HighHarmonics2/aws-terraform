####################
# vpc outputs
output "vpc-private1-id" {
  value = "${aws_vpc.vpc-private-1.id}"
}

output "vpc-private1-default-acl" {
  value = "${aws_vpc.vpc-private-1.default_network_acl_id}"
}

output "vpc-private1-default-sg" {
  value = "${aws_vpc.vpc-private-1.default_security_group_id}"
}

output "vpc-private1-default-routetable" {
  value = "${aws_vpc.vpc-private-1.default_route_table_id}"
}

output "vpc-private1-dhcp" {
  value = "${aws_vpc.vpc-private-1.dhcp_options_id}"
}

#######################
# vpc subnet outputs
output "vpc-subnet-1a" {
  value = "${aws_subnet.vpc-private-1a.id}"
}

output "vpc-subnet-1b" {
  value = "${aws_subnet.vpc-private-1b.id}"
}

#######################
# vpc peering

output "vpc-peering-1a" {
  value = "${aws_vpc_peering_connection.vpc-peer-default-to-private-1a.id}"
}
