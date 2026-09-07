#create a security group with name SG1

resource "aws_security_group" "SG1" {
    name = "SG1"
}

#need to enable port 9100,3389,443,445,22,21,20 ports from the IP range

resource "aws_vpc_security_group_ingress_rule" "rule" {
  security_group_id = aws_security_group.SG1.id
  for_each = toset([for p in var.pts : tostring(p)])
  from_port = each.value
  to_port = each.value
  ip_protocol = "tcp"
  cidr_ipv4 = var.ip
}