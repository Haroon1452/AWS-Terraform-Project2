
terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "project_info" {
  input = {
    project_name  = "AWS Cloud Engineering - Project 2"
    environment   = "development"
    region        = "eu-north-1"
    project_phase = "Phase 1 - Terraform Fundamentals"
    managed_by    = "Terraform"
  }
}

output "project_details" {
  value = terraform_data.project_info.output
}
