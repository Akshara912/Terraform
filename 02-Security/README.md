02 - Security (VPC, Subnet & Security Group)
This module provisions core AWS networking and security infrastructure using Terraform: a VPC, a subnet, a security group, and its inbound/outbound rules.
What This Creates
VPC (aws_vpc) — the base network with a configurable CIDR block.
Subnet (aws_subnet) — a subnet carved out of the VPC's CIDR range.
Security Group (aws_security_group) — attached to the VPC, named and described dynamically based on the environment.
Inbound Rules (aws_vpc_security_group_ingress_rule) — allows TCP traffic on multiple ports (22, 80) using a for_each loop over a list variable.
Outbound Rule (aws_vpc_security_group_egress_rule) — allows all outbound traffic (ip_protocol = -1).
File Structure
File
Purpose
provider.tf
AWS provider configuration
main.tf
VPC, subnet, security group, ingress rule, and egress rule resources
varibale.tf
Variable declarations (vpc_cidr, subnet_cidr, environment, rule_port)
terraform.tfvars
Variable values for this environment
