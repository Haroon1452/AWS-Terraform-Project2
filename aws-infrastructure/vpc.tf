
resource "aws_vpc" "project2_vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "project2-vpc"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}
