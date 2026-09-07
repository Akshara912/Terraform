data "aws_ami" "def" {
    owners = [ "amazon" ]
    most_recent = true

    filter {
      name = "name"
      values = ["aws-elasticbeanstalk-amzn-*"]
    }
  
}

resource "aws_instance" "MyEc2" {
    ami = data.aws_ami.def.image_id
    instance_type = "t3.micro"

    tags = {
      "Name" = "My_EC2"
      Team = "Production"
      
    }

  
}

output "details" {
    value = var.reg
  
}

output "id" {

    value = aws_instance.MyEc2.id
  
}
