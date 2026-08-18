resource "aws_instance" "MyEc2" {
    ami = "ami-0ac7b260cf76d8865"
    instance_type = "var.environment" == "production" ? "t3.small": "t3.micro"
    count = "${var.instance_count}"

    tags = {
      Name = "My_server_${count.index}"
    }
}
