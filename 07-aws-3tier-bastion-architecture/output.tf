output "bastionIP" {
    value = aws_instance.myec2.public_ip
  
}

output "appIP" {

    value = aws_instance.APPEC2.private_ip
}

output "DBIP"{
    value = aws_instance.DBEC2.private_ip
  
}