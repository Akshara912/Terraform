
resource "aws_subnet" "sub" {
    vpc_id = aws_vpc.myVPC.id
    for_each = var.subnetdet
    cidr_block = each.value
    tags = {
      name = each.key
    }

  
}

resource "aws_internet_gateway" "myIGW" {
    vpc_id = aws_vpc.myVPC.id
    tags = {
      name = "MyIGW"
    }
  
}

resource "aws_eip" "elip" {
    
}

resource "aws_nat_gateway" "myNat"{
    subnet_id = aws_subnet.sub["PublicSubnet"].id
    allocation_id = aws_eip.elip.id

  
}

resource "aws_security_group" "securitygp" {
    vpc_id = aws_vpc.myVPC.id
    for_each = toset(var.sgname)
    name = each.value
  
}
resource "aws_vpc_security_group_ingress_rule" "Bastionrule" {

    security_group_id = aws_security_group.securitygp["BastionSG"].id
    from_port = 3389
    to_port = 3389
    ip_protocol = "TCP"
    cidr_ipv4 = "0.0.0.0/0"
    
  
}


resource "aws_vpc_security_group_egress_rule" "baserr" {
  security_group_id = aws_security_group.securitygp["BastionSG"].id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 3389
  ip_protocol = "tcp"
  to_port     = 3389
}


resource "aws_vpc_security_group_ingress_rule" "APPrule" {
    security_group_id = aws_security_group.securitygp["APP-SG"].id
    from_port = 3389
    to_port = 3389
    ip_protocol = "tcp"
  referenced_security_group_id = aws_security_group.securitygp["BastionSG"].id
  
}

resource "aws_vpc_security_group_ingress_rule" "DBrule" {
    security_group_id = aws_security_group.securitygp["DB-SG"].id
    from_port = 3306
    to_port = 3306
    ip_protocol = "TCP"
    referenced_security_group_id = aws_security_group.securitygp["BastionSG"].id
    
  
}

