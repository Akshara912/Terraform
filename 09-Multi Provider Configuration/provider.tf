resource "aws_security_group" "SG1" {
    name = "Prod SG"
    provider = aws.Singapore
  
}

resource "aws_security_group" "SG2" {
    name = "Dev SG"
    provider = aws.ohio
  
}