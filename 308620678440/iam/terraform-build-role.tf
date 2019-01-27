/* role and policy for use with terraform-build */
### creates IAM role for terraform-build2 and establishes the Trust Relationship
## here I am using this as an assumed role with local creds from a user role

resource "aws_iam_role" "terraform-build2" {
  name = "terraform-build2"
  max_session_duration    = "14400"
  assume_role_policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "0",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::308620678440:user/jure2"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF

  tags = {
    Environment     = "sbx"
    CreatedBy       = "terraform"
    TestValue       = "none"
  }
}

# this creates an instance profile for the role - needed for an EC2 instance to use the role

resource "aws_iam_instance_profile" "terraform-build2-ip" {
   name = "terraform-build2Profile"
   role = "${aws_iam_role.terraform-build2.name}"
}

######################################################
/* create managed policy for terraform build access rights
   the vpc Sid section should not be needed since ec2:* is also covered - but I include it here
   for reference - copied from AmazonVPCFullAccess service role
   REMINDER: the heredoc section MUST have the initial {} at the beginning of the line!
*/

resource "aws_iam_policy" "terraform-build-policy" {
  name        = "terraform-build2"
  path        = "/"
  description = "Policy for use with Terraform / Terragrunt"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "0",
            "Effect": "Allow",
            "Action": [
                "iam:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "s3:*",
                "cloudwatch:*",
                "logs:*",
                "events:*",
                "cloudtrail:*",
                "sns:*",
                "route53:*",
                "apigateway:*",
                "lambda:*",
                "kms:*",
                "dynamodb:*",
                "rds:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "1",
            "Effect": "Allow",
            "Action": [
                "ec2:AcceptVpcPeeringConnection",
                "ec2:AcceptVpcEndpointConnections",
                "ec2:AllocateAddress",
                "ec2:AssignIpv6Addresses",
                "ec2:AssignPrivateIpAddresses",
                "ec2:AssociateAddress",
                "ec2:AssociateDhcpOptions",
                "ec2:AssociateRouteTable",
                "ec2:AssociateSubnetCidrBlock",
                            "ec2:AssociateVpcCidrBlock",
                            "ec2:AttachClassicLinkVpc",
                            "ec2:AttachInternetGateway",
                            "ec2:AttachNetworkInterface",
                            "ec2:AttachVpnGateway",
                            "ec2:AuthorizeSecurityGroupEgress",
                            "ec2:AuthorizeSecurityGroupIngress",
                            "ec2:CreateCustomerGateway",
                            "ec2:CreateDefaultSubnet",
                            "ec2:CreateDefaultVpc",
                            "ec2:CreateDhcpOptions",
                            "ec2:CreateEgressOnlyInternetGateway",
                            "ec2:CreateFlowLogs",
                            "ec2:CreateInternetGateway",
                            "ec2:CreateNatGateway",
                            "ec2:CreateNetworkAcl",
                            "ec2:CreateNetworkAcl",
                            "ec2:CreateNetworkAclEntry",
                            "ec2:CreateNetworkInterface",
                            "ec2:CreateNetworkInterfacePermission",
                            "ec2:CreateRoute",
                            "ec2:CreateRouteTable",
                            "ec2:CreateSecurityGroup",
                            "ec2:CreateSubnet",
                            "ec2:CreateTags",
                            "ec2:CreateVpc",
                            "ec2:CreateVpcEndpoint",
                            "ec2:CreateVpcEndpointConnectionNotification",
                            "ec2:CreateVpcEndpointServiceConfiguration",
                            "ec2:CreateVpcPeeringConnection",
                            "ec2:CreateVpnConnection",
                            "ec2:CreateVpnConnectionRoute",
                            "ec2:CreateVpnGateway",
                            "ec2:DeleteCustomerGateway",
                            "ec2:DeleteDhcpOptions",
                            "ec2:DeleteEgressOnlyInternetGateway",
                            "ec2:DeleteFlowLogs",
                            "ec2:DeleteInternetGateway",
                            "ec2:DeleteNatGateway",
                            "ec2:DeleteNetworkAcl",
                            "ec2:DeleteNetworkAclEntry",
                            "ec2:DeleteNetworkInterface",
                            "ec2:DeleteNetworkInterfacePermission",
                            "ec2:DeleteRoute",
                            "ec2:DeleteRouteTable",
                            "ec2:DeleteSecurityGroup",
                            "ec2:DeleteSubnet",
                            "ec2:DeleteTags",
                            "ec2:DeleteVpc",
                            "ec2:DeleteVpcEndpoints",
                            "ec2:DeleteVpcEndpointConnectionNotifications",
                            "ec2:DeleteVpcEndpointServiceConfigurations",
                            "ec2:DeleteVpcPeeringConnection",
                            "ec2:DeleteVpnConnection",
                            "ec2:DeleteVpnConnectionRoute",
                            "ec2:DeleteVpnGateway",
                            "ec2:DescribeAccountAttributes",
                            "ec2:DescribeAddresses",
                            "ec2:DescribeAvailabilityZones",
                            "ec2:DescribeClassicLinkInstances",
                            "ec2:DescribeCustomerGateways",
                            "ec2:DescribeDhcpOptions",
                            "ec2:DescribeEgressOnlyInternetGateways",
                            "ec2:DescribeFlowLogs",
                            "ec2:DescribeInstances",
                            "ec2:DescribeInternetGateways",
                            "ec2:DescribeKeyPairs",
                            "ec2:DescribeMovingAddresses",
                            "ec2:DescribeNatGateways",
                            "ec2:DescribeNetworkAcls",
                            "ec2:DescribeNetworkInterfaceAttribute",
                            "ec2:DescribeNetworkInterfacePermissions",
                            "ec2:DescribeNetworkInterfaces",
                            "ec2:DescribePrefixLists",
                            "ec2:DescribeRouteTables",
                            "ec2:DescribeSecurityGroupReferences",
                            "ec2:DescribeSecurityGroups",
                            "ec2:DescribeStaleSecurityGroups",
                            "ec2:DescribeSubnets",
                            "ec2:DescribeTags",
                            "ec2:DescribeVpcAttribute",
                            "ec2:DescribeVpcClassicLink",
                            "ec2:DescribeVpcClassicLinkDnsSupport",
                            "ec2:DescribeVpcEndpointConnectionNotifications",
                            "ec2:DescribeVpcEndpointConnections",
                            "ec2:DescribeVpcEndpoints",
                            "ec2:DescribeVpcEndpointServiceConfigurations",
                            "ec2:DescribeVpcEndpointServicePermissions",
                            "ec2:DescribeVpcEndpointServices",
                            "ec2:DescribeVpcPeeringConnections",
                            "ec2:DescribeVpcs",
                            "ec2:DescribeVpnConnections",
                            "ec2:DescribeVpnGateways",
                            "ec2:DetachClassicLinkVpc",
                            "ec2:DetachInternetGateway",
                            "ec2:DetachNetworkInterface",
                            "ec2:DetachVpnGateway",
                            "ec2:DisableVgwRoutePropagation",
                            "ec2:DisableVpcClassicLink",
                            "ec2:DisableVpcClassicLinkDnsSupport",
                            "ec2:DisassociateAddress",
                            "ec2:DisassociateRouteTable",
                            "ec2:DisassociateSubnetCidrBlock",
                            "ec2:DisassociateVpcCidrBlock",
                            "ec2:EnableVgwRoutePropagation",
                            "ec2:EnableVpcClassicLink",
                            "ec2:EnableVpcClassicLinkDnsSupport",
                            "ec2:ModifyNetworkInterfaceAttribute",
                            "ec2:ModifySubnetAttribute",
                            "ec2:ModifyVpcAttribute",
                            "ec2:ModifyVpcEndpoint",
                            "ec2:ModifyVpcEndpointConnectionNotification",
                            "ec2:ModifyVpcEndpointServiceConfiguration",
                            "ec2:ModifyVpcEndpointServicePermissions",
                            "ec2:ModifyVpcPeeringConnectionOptions",
                            "ec2:ModifyVpcTenancy",
                            "ec2:MoveAddressToVpc",
                            "ec2:RejectVpcEndpointConnections",
                            "ec2:RejectVpcPeeringConnection",
                            "ec2:ReleaseAddress",
                            "ec2:ReplaceNetworkAclAssociation",
                            "ec2:ReplaceNetworkAclEntry",
                            "ec2:ReplaceRoute",
                            "ec2:ReplaceRouteTableAssociation",
                            "ec2:ResetNetworkInterfaceAttribute",
                            "ec2:RestoreAddressToClassic",
                            "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:UnassignIpv6Addresses",
                "ec2:UnassignPrivateIpAddresses",
                "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
                "ec2:UpdateSecurityGroupRuleDescriptionsIngress"
                ],
                "Resource": "*"
        }
    ]
}
EOF
}

######################################################
# attach policy to terraform-build2 role
resource "aws_iam_role_policy_attachment" "attach-terraform-build2" {
  role       = "${aws_iam_role.terraform-build2.name}"
  policy_arn = "${aws_iam_policy.terraform-build-policy.arn}"
}
