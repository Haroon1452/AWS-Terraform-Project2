
resource "aws_internet_gateway" "project2_igw" {
  vpc_id = aws_vpc.project2_vpc.id

  tags = {
    Name        = "project2-igw"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}
