# ==================================== Public Route Table ======================================
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
  tags = {
    Name = "Cloud_PD44_Public_Route_Table"
  }
}

resource "aws_route_table_association" "public_rt_associate" {
  subnet_id      = aws_subnet.public_subnet_I.id
  route_table_id = aws_route_table.public_rt.id
}

# ==================================== Private Route Table ======================================
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main_ngw.id
  }
  tags = {
    Name = "Cloud_PD44_Private_Route_Table"
  }
}

resource "aws_route_table_association" "private_rt_associate" {
  subnet_id      = aws_subnet.private_subnet_I.id
  route_table_id = aws_route_table.private_rt.id
}
