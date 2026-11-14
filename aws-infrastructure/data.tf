
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

output "aws_region_name" {
  description = "AWS region configured for this project"
  value       = data.aws_region.current.region
}