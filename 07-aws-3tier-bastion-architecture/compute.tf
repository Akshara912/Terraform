resource "aws_instance" "myec2" {
 ami = "ami-074ed8814cda18d42"
 instance_type = "t3.micro"
 subnet_id = aws_subnet.sub["PublicSubnet"].id
 associate_public_ip_address = true
 vpc_security_group_ids = [aws_security_group.securitygp["BastionSG"].id]
key_name = "key"
 tags = {
   name = "BastionEC2"
 }

}

resource "aws_instance" "APPEC2" {
 ami = "ami-074ed8814cda18d42"
 instance_type = "t3.micro"
 subnet_id = aws_subnet.sub["PrivateSubnet-APP"].id
 vpc_security_group_ids = [aws_security_group.securitygp["APP-SG"].id]
key_name = "key"
 associate_public_ip_address = true
 tags = {
   name = "APP-EC2"
 }

}
  

resource "aws_instance" "DBEC2" {
 ami = "ami-074ed8814cda18d42"
 instance_type = "t3.micro"
 subnet_id = aws_subnet.sub["PrivateSubnet-DB"].id
 vpc_security_group_ids = [aws_security_group.securitygp["DB-SG"].id]
key_name = "key"
 associate_public_ip_address = true
 tags = {
   name = "DB-EC2"
 }

}
