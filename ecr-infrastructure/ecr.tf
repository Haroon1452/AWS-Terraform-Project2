
resource "aws_ecr_repository" "cicd_app" {
  name                 = "aws-cicd-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "aws-cicd-app"
    Project     = "AWS-Terraform-Project2"
    Environment = "development"
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_lifecycle_policy" "cicd_app" {
  repository = aws_ecr_repository.cicd_app.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only the latest 3 images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 3
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
