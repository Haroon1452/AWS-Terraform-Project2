# AWS Cloud Infrastructure with Terraform

Infrastructure as Code (IaC) portfolio project demonstrating how to design and configure a multi-tier AWS network using Terraform.

**Project Status:** Infrastructure configuration completed and validated locally. AWS resources have not yet been deployed.

## Project Overview

This project focuses on building reusable AWS infrastructure using Terraform, with an emphasis on networking, security, infrastructure automation, and cost-conscious cloud engineering.

It builds on my previous AWS three-tier architecture project, where I worked with VPC networking, EC2, Application Load Balancer, Auto Scaling, RDS MySQL, and CloudFront.

## Architecture

**AWS Region:** Europe (Stockholm) — `eu-north-1`

**VPC CIDR:** `10.20.0.0/16`

The planned architecture includes:

- One VPC with DNS support and DNS hostnames enabled
- Two public subnets across separate Availability Zones
- Two private subnets across separate Availability Zones
- One Internet Gateway
- Public and private route tables with subnet associations
- Three security groups representing web, application, and database tiers
- Terraform outputs for important infrastructure identifiers

### Network Design

| Subnet | Availability Zone | CIDR |
|---|---|---|
| Public Subnet 1 | eu-north-1a | 10.20.1.0/24 |
| Public Subnet 2 | eu-north-1b | 10.20.2.0/24 |
| Private Subnet 1 | eu-north-1a | 10.20.11.0/24 |
| Private Subnet 2 | eu-north-1b | 10.20.12.0/24 |

Public subnets are associated with a route table containing a default route to the Internet Gateway.

Private subnets use a separate route table without a default internet route.

No NAT Gateway is configured at this stage to avoid unnecessary recurring charges.

### Security Group Design

| Security Group | Inbound Access | Purpose |
|---|---|---|
| Web | TCP 80 and 443 from `0.0.0.0/0` | HTTP and HTTPS |
| Application | TCP 3000 from Web SG | Application traffic |
| Database | TCP 3306 from Application SG | MySQL connectivity |

Explicit outbound rules are configured for web-to-application traffic on port 3000 and application-to-database traffic on port 3306.

Port 3000 is a placeholder and will be adjusted according to the application deployed.

Security group behavior and connectivity will require verification after deployment. In a production architecture using an Application Load Balancer, web-tier access should be restricted appropriately.

## Repository Structure

```text
aws-terraform-project2/
├── .gitignore
├── README.md
├── terraform-basics/
│   └── main.tf
└── aws-infrastructure/
    ├── .terraform.lock.hcl
    ├── providers.tf
    ├── data.tf
    ├── vpc.tf
    ├── subnets.tf
    ├── internet-gateway.tf
    ├── route-tables.tf
    ├── security-groups.tf
    └── outputs.tf
```

## Tools and Technologies

- Terraform
- AWS CLI
- AWS VPC
- AWS Internet Gateway
- AWS Route Tables
- AWS Security Groups
- Git and GitHub
- Visual Studio Code

## Local Validation

The following Terraform commands were used:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Latest reviewed Terraform plan:

```text
Plan: 21 to add, 0 to change, 0 to destroy.
```

This plan represents the intended infrastructure. It does not indicate that AWS resources have been deployed.

## Deployment

Before deploying, review the planned resources, AWS permissions, security configuration, and estimated costs.

From the `aws-infrastructure` directory:

```bash
terraform init
terraform validate
terraform plan
```

Deployment is intentionally deferred until cost and security checks are completed.

Once deployment is approved, Terraform can be used to provision the infrastructure. Resources should be destroyed when no longer required to minimize charges.

## Cost Optimization

This project follows a cost-conscious learning approach.

- Infrastructure is validated locally before deployment.
- NAT Gateway is omitted during the initial phase.
- EC2, RDS, load balancers, and other potentially billable services are not currently provisioned by this configuration.
- AWS pricing and service charges must be reviewed before deployment.
- Terraform state files and local credentials are excluded from Git.

## Future Improvements

- Introduce reusable Terraform modules
- Add application infrastructure when deployment is approved
- Integrate GitHub Actions for CI/CD
- Build and publish Docker images to Amazon ECR
- Configure staging deployments
- Implement deployment verification and rollback
- Expand monitoring and documentation

## Related Project

**AWS Three-Tier Portfolio Website**

[View Project 1 on GitHub](https://github.com/Haroon1452/aws-portfolio-project)

The previous project demonstrated practical deployment of AWS networking, compute, load balancing, database, and content delivery services. Its infrastructure was subsequently deleted to avoid ongoing costs.

## Author

Cloud Engineering Portfolio — AWS, Terraform, DevOps, and Infrastructure Automation.
