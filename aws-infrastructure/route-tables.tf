
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project2_igw.id
  }

  tags = {
    Name        = "project2-public-rt"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.project2_vpc.id

  tags = {
    Name        = "project2-private-rt"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_rt.id
}