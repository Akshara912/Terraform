resource "aws_instance" "prjct" {
    ami = lookup(var.image,var.reg)
    instance_type = var.environment == "Production" ? "t3.small" : "t3.micro"
    count = length(var.def)

    tags = {
      Name = element(var.def,count.index)
      Deployement_time = formatdate("DD MM YYYY hh:mm ZZZ", timestamp())
    }
}