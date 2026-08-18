
#Creating a VPC:

resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "Terraform-${var.environment}-vpc"
    }
  
}

#Creating subnet
resource "aws_subnet" "Subnet1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.subnet_cidr

    tags = {
      Name = "Terraform-${var.environment}-subnet"
    }
  
}

#Creating a Security group
resource "aws_security_group" "SG1" {
    vpc_id = aws_vpc.vpc1.id
    name = "Terraform-${var.environment}-sg"
    description = "security group for ${var.environment} environment"
  
}

#creating inbound rules which allow port 22 and 80
resource "aws_vpc_security_group_ingress_rule" "inbound" {
    security_group_id = aws_security_group.SG1.id
    for_each = toset(var.rule_port)
    from_port = each.value
    to_port = each.value
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/32"
}

#creating outbout rules
resource "aws_vpc_security_group_egress_rule" "outbout" {
    security_group_id = aws_security_group.SG1.id
    from_port = 0
    to_port = 0
    cidr_ipv4 = "10.0.1.0/32"
    ip_protocol = -1
  
}
