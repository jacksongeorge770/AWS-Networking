#creating elastic ip for NAT gateway. elastic
resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name = "NAT EIP"
  }
}

#creating a nat gateways for internet access to ec2machine in private subnet


resource "aws_nat_gateway" "NAT-Gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id  
  tags = {
    Name = "NAT Gateway"
  }
}


