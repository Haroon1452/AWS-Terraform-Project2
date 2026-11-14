
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.project2_vpc.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "project2-public-subnet-1a"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}


resource "aws_subnet" "private_subnet_1a" {
  vpc_id                  = aws_vpc.project2_vpc.id
  cidr_block              = "10.20.11.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "project2-private-subnet-1a"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}


resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.project2_vpc.id
  cidr_block              = "10.20.2.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name        = "project2-public-subnet-1b"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id                  = aws_vpc.project2_vpc.id
  cidr_block              = "10.20.12.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name        = "project2-private-subnet-1b"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}