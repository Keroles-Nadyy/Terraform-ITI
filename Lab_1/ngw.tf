resource "aws_eip" "main_nat_eip" {
  # vpc = true
  domain = "vpc"
  tags = {
    "Name" = "Cloud_PD44_EIP"
  }
}

resource "aws_nat_gateway" "main_ngw" {
  allocation_id = aws_eip.main_nat_eip.id
  subnet_id     = aws_subnet.public_subnet_I.id
  depends_on    = [aws_internet_gateway.main_igw]

  tags = {
    Name = "Cloud_PD44_NGW"
  }
}