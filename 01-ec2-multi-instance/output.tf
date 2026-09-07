output "Instance-ID" {
  value = aws_instance.MyEc2[*].id
}

output "Public-IP" {
    value = aws_instance.MyEc2[*].public_ip
  }

output "Instance-name" {
    value = "${aws_instance.MyEc2[*].tags["Name"]}"
  
}
