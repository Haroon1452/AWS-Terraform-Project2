
resource "aws_security_group" "web_sg" {
  name        = "project2-web-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.project2_vpc.id

  tags = {
    Name        = "project2-web-sg"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

  description = "Allow HTTP traffic"
}

resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"

  description = "Allow HTTPS traffic"
}





resource "aws_security_group" "app_sg" {
  name        = "project2-app-sg"
  description = "Security group for application servers"
  vpc_id      = aws_vpc.project2_vpc.id

  tags = {
    Name        = "project2-app-sg"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_from_web" {
  security_group_id            = aws_security_group.app_sg.id
  referenced_security_group_id = aws_security_group.web_sg.id

  from_port   = 3000
  to_port     = 3000
  ip_protocol = "tcp"

  description = "Allow application traffic from web servers"
}



resource "aws_security_group" "db_sg" {
  name        = "project2-db-sg"
  description = "Security group for MySQL database"
  vpc_id      = aws_vpc.project2_vpc.id

  tags = {
    Name        = "project2-db-sg"
    Environment = "development"
    Project     = "AWS-Terraform-Project2"
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db_from_app" {
  security_group_id            = aws_security_group.db_sg.id
  referenced_security_group_id = aws_security_group.app_sg.id

  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"

  description = "Allow MySQL traffic from application servers"
}



resource "aws_vpc_security_group_egress_rule" "web_to_app" {
  security_group_id            = aws_security_group.web_sg.id
  referenced_security_group_id = aws_security_group.app_sg.id

  from_port   = 3000
  to_port     = 3000
  ip_protocol = "tcp"

  description = "Allow web servers to connect to application servers"
}

resource "aws_vpc_security_group_egress_rule" "app_to_db" {
  security_group_id            = aws_security_group.app_sg.id
  referenced_security_group_id = aws_security_group.db_sg.id

  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"

  description = "Allow application servers to connect to MySQL"
}
