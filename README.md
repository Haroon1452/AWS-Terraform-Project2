# AWS Cloud Infrastructure with Terraform

**Infrastructure as Code (IaC) | AWS Networking | Cloud Security | Terraform**

A hands-on AWS Cloud Engineering portfolio project demonstrating the design, deployment, verification, and cleanup of a multi-tier AWS networking foundation using Terraform.

**Project Status:** Successfully deployed, verified, and destroyed to minimize ongoing AWS costs.

## Project Overview

This project demonstrates how Terraform can automate the provisioning and management of AWS infrastructure.

The objective was to design a secure, multi-tier networking foundation using public and private subnets, route tables, an Internet Gateway, and security groups.

The infrastructure was deployed in AWS, verified using AWS CLI and Terraform, and subsequently destroyed after testing.

### Key Achievements

- Provisioned 21 Terraform-managed AWS resources.
- Created a VPC spanning two Availability Zones.
- Configured four public and private subnets.
- Implemented public and private routing.
- Configured security groups for web, application, and database tiers.
- Verified deployed resources using AWS CLI.
- Confirmed infrastructure consistency using `terraform plan`.
- Successfully destroyed all 21 Terraform-managed resources.
- Verified VPC deletion using AWS CLI.

**Scope:** This project implements the networking and security foundation. EC2 instances, databases, load balancers, and application workloads were not deployed.

## Architecture

| Component | Configuration |
|---|---|
| AWS Region | Europe (Stockholm), `eu-north-1` |
| VPC | `10.20.0.0/16` |
| Availability Zones | `eu-north-1a`, `eu-north-1b` |
| Public Subnets | 2 |
| Private Subnets | 2 |
| Internet Gateway | 1 |
| Route Tables | 2 Terraform-managed |
| Security Groups | 3 Terraform-managed |
| NAT Gateway | Not deployed |

### Network Design

| Subnet | Availability Zone | CIDR |
|---|---|---|
| Public Subnet 1 | eu-north-1a | 10.20.1.0/24 |
| Public Subnet 2 | eu-north-1b | 10.20.2.0/24 |
| Private Subnet 1 | eu-north-1a | 10.20.11.0/24 |
| Private Subnet 2 | eu-north-1b | 10.20.12.0/24 |

Public subnets use a route table with a default route (`0.0.0.0/0`) pointing to the Internet Gateway.

Private subnets use a separate route table containing only the VPC local route.

A NAT Gateway was intentionally omitted to avoid unnecessary recurring charges.

Automatic public IPv4 assignment was disabled on all four subnets.

## Security Group Design

The project implements three security groups to represent traffic boundaries between application tiers.

| Security Group | Inbound Rules | Outbound Rules |
|---|---|---|
| Web | TCP 80 and 443 from `0.0.0.0/0` | TCP 3000 to Application SG |
| Application | TCP 3000 from Web SG | TCP 3306 to Database SG |
| Database | TCP 3306 from Application SG | No explicit outbound rules |

These rules establish the intended communication path:

**Web → Application → Database**

Port 3000 represents a placeholder application port.

Security group configuration was verified using AWS CLI. End-to-end application connectivity was not tested because no compute instances or databases were deployed.

For production use, the security group rules would need to be reviewed according to the selected load-balancing and application architecture.

## Repository Structure

```text
aws-terraform-project2/
├── .gitignore
├── README.md
├── terraform-basics/
│   └── main.tf
├── aws-infrastructure/
│   ├── .terraform.lock.hcl
│   ├── providers.tf
│   ├── data.tf
│   ├── vpc.tf
│   ├── subnets.tf
│   ├── internet-gateway.tf
│   ├── route-tables.tf
│   ├── security-groups.tf
│   └── outputs.tf
└── docs/
    └── screenshots/
```

Deployment screenshots will be uploaded separately to the `docs/screenshots/` directory on GitHub.

Terraform state files, local credentials, and saved plan files are excluded from version control.

## Tools and Technologies

- HashiCorp Terraform
- Amazon Web Services (AWS)
- AWS CLI
- Amazon VPC
- AWS Internet Gateway
- AWS Route Tables
- AWS Security Groups
- Git and GitHub
- Visual Studio Code
- macOS Terminal

## Terraform Deployment Workflow

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Format and Validate

```bash
terraform fmt
terraform validate
```

### 3. Review Infrastructure Plan

```bash
terraform plan
```

The initial deployment plan identified:

```text
Plan: 21 to add, 0 to change, 0 to destroy.
```

### 4. Deploy Infrastructure

```bash
terraform apply
```

The deployment successfully provisioned 21 Terraform-managed AWS resources.

### 5. Verify Infrastructure

AWS CLI commands were used to inspect the deployed networking resources.

Example:

```bash
aws ec2 describe-vpcs \
  --region eu-north-1 \
  --profile terraform-project2
```

The VPC, four subnets, Internet Gateway, public/private route tables, and security groups were verified.

A subsequent `terraform plan` confirmed:

```text
No changes. Your infrastructure matches the configuration.
```

### 6. Destroy Infrastructure

After verification, the deployed infrastructure was removed using:

```bash
terraform destroy
```

Terraform reported:

```text
Destroy complete! Resources: 21 destroyed.
```

A subsequent AWS CLI lookup of the deleted VPC returned `InvalidVpcID.NotFound`, confirming its removal.

**Current status:** The Project 2 networking infrastructure is no longer deployed.

## Deployment Evidence

AWS Console screenshots were captured during deployment and verification.

Evidence includes:

- VPC configuration
- Public and private subnet configuration
- Internet Gateway
- Public and private route tables
- Web, application, and database security groups
- Security group inbound rules

Screenshots will be added to the GitHub repository under `docs/screenshots/`.

## Cost Optimization

This project follows a cost-conscious cloud engineering approach.

- Reviewed Terraform configuration before deployment.
- Avoided NAT Gateway deployment.
- Did not provision EC2, RDS, or load balancers.
- Used Terraform to provision and subsequently remove the infrastructure.
- Verified successful deletion of the project VPC.
- Excluded Terraform state and credential files from Git.

AWS billing should still be reviewed independently, as infrastructure deletion does not automatically confirm a zero bill.

## Future Improvements

- Refactor infrastructure into reusable Terraform modules.
- Introduce GitHub Actions CI/CD workflows.
- Containerize a sample application using Docker.
- Publish container images to Amazon ECR.
- Implement a staging deployment environment.
- Configure secure CI/CD authentication.
- Introduce deployment verification and rollback procedures.
- Add monitoring and operational documentation.

These are planned enhancements and are not part of the completed networking deployment.

## Related Project

### AWS Three-Tier Portfolio Website

[View Project 1 on GitHub](https://github.com/Haroon1452/aws-portfolio-project)

My previous project involved AWS VPC networking, EC2, Application Load Balancer, Auto Scaling, RDS MySQL, and CloudFront.

Its infrastructure was subsequently removed to avoid ongoing costs.

## Conclusion

This project demonstrates practical experience with Infrastructure as Code, AWS networking, security group configuration, infrastructure verification, and responsible resource lifecycle management.

It provides a foundation for future cloud automation and DevOps projects.