resource "aws_vpc" "vpc-private-1" {
  cidr_block                       = "192.168.0.0/24" #254 address range
  assign_generated_ipv6_cidr_block = true  # needed for egress only gate
  enable_dns_hostnames            = true
  enable_dns_support              = true

  tags = {
    Environment		= "sbx"
    CreatedBy		  = "terraform"
  }
}

resource "aws_subnet" "vpc-private-1a" {
  vpc_id		        = "${aws_vpc.vpc-private-1.id}"
  cidr_block		    = "192.168.0.0/26"
  availability_zone = "us-west-2a"

  tags = {
    Environment     = "sbx"
    CreatedBy       = "terraform"
  }
}

resource "aws_subnet" "vpc-private-1b" {
  vpc_id		        = "${aws_vpc.vpc-private-1.id}"
  cidr_block		    = "192.168.0.64/26"
  availability_zone = "us-west-2a"

  tags = {
    Environment     = "sbx"
    CreatedBy       = "terraform"
  }
}

resource "aws_vpc_peering_connection" "vpc-peer-default-to-private-1a" {
  peer_vpc_id   = "${aws_vpc.vpc-private-1.id}" # accepter vpc
  vpc_id        = "vpc-f6784393" #default vpc w internet gate requester vcp
  auto_accept   = true

  tags = {
    Environment         = "sbx"
    CreatedBy           = "terraform"
  }
}

resource "aws_security_group" "vpc-private1-sg1" {
  name                  = "ssh-https"
  description           = "SG for ssh and http, https from peered"
  vpc_id                = "${aws_vpc.vpc-private-1.id}"

  ingress {
    from_port           = 22
    to_port             = 22
    protocol            = "tcp"
    cidr_blocks         = ["172.31.16.0/20"]
    description         = "ssh access from peered subnet"
  }

  ingress {
    from_port           = 80
    to_port             = 80
    protocol            = "tcp"
    cidr_blocks         = ["172.31.16.0/20"]
    description         = "http access from peered subnet"
  }

  ingress {
    from_port           = 443
    to_port             = 443
    protocol            = "tcp"
    cidr_blocks         = ["172.31.16.0/20"]
    description         = "https access from peered subnet"
  }

  ingress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    self                = true
    description         = "internal"
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
  }

}

resource "aws_route" "peering-default-route" {
  route_table_id            = "rtb-73c4ce16"
  destination_cidr_block    = "192.168.0.0/26"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc-peer-default-to-private-1a.id}"
}

resource "aws_route" "peering-private-1a-route" {
  route_table_id            = "${aws_vpc.vpc-private-1.default_route_table_id}"
  destination_cidr_block    = "172.31.16.0/20"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc-peer-default-to-private-1a.id}"
}

resource "aws_egress_only_internet_gateway" "vpc-private1-egress" {
    vpc_id = "${aws_vpc.vpc-private-1.id}"
}

### route for private egress
resource "aws_route" "private1-egress-route" {
  route_table_id            = "${aws_vpc.vpc-private-1.default_route_table_id}"
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id    = "${aws_egress_only_internet_gateway.vpc-private1-egress.id}"
  depends_on                = ["aws_egress_only_internet_gateway.vpc-private1-egress"]
}
