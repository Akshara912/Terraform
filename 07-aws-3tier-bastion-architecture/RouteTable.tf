resource "aws_route_table" "pubrt" {
        vpc_id = aws_vpc.myVPC.id
        

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myIGW.id
        
    }
    tags = {
        name = "PublicGW"
    }
  
}
resource "aws_route_table" "prvt" {
    vpc_id = aws_vpc.myVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.myNat.id
    }
  
}

resource "aws_route_table_association" "pub-assoc" {
    subnet_id = aws_subnet.sub["PublicSubnet"].id
    route_table_id = aws_route_table.pubrt.id
  
}

resource "aws_route_table_association" "app-assoc" {
    subnet_id = aws_subnet.sub["PrivateSubnet-APP"].id
    route_table_id = aws_route_table.prvt.id
  
}

resource "aws_route_table_association" "DB-assoc" {
    subnet_id = aws_subnet.sub["PrivateSubnet-DB"].id
    route_table_id = aws_route_table.prvt.id
  
}