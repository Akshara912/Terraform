resource "aws_eip" "temp" {
  domain = "vpc"
}

output "MyEIP" {
    value = aws_eip.temp.public_ip

  
}