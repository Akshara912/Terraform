data "terraform_remote_state" "eip" {
    backend = "s3"

    config = {
        bucket = "mybackened-bucket"
        key = "myS3"
        region = "ap-south-1"
    }


}
resource "aws_security_group" "SG" {

    name = "WhiteListing SG"

  }

resource "aws_vpc_security_group_ingress_rule" "inbound" {
    security_group_id = aws_security_group.SG.id
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr_ipv4 = "${data.terraform_remote_state.eip.outputs.MyEIP}/32"
}