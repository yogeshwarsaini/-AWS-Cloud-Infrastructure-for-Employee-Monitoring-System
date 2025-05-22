# AWS-Cloud-Infrastructure-for-Employee-Monitoring-System
# 🏗️ Time Doctor Infrastructure – Terraform Setup
This project provides a complete Terraform-based infrastructure setup on AWS for an employee monitoring system (like Time Doctor). It includes modular resources for VPC, EC2, S3, RDS, DynamoDB, IAM, Cognito, and CloudWatch — all designed for scalability, security, and easy deployment across environments.


---

## 📁 Project Structure
```
timedoctor-infra/
├── main.tf                   # Root module integration
├── variables.tf              # Global variables
├── outputs.tf                # Global outputs
│
├── modules/                  # All reusable Terraform modules
│   ├── vpc/                  # Networking (VPC, subnets, routes)
│   ├── ec2/                  # Application EC2 servers
│   ├── rds/                  # PostgreSQL DB
│   ├── s3/                   # Screenshots/assets bucket
│   ├── dynamodb/             # Real-time activity logs
│   ├── cognito/              # Authentication system
│   ├── cloudwatch/           # Monitoring & alarms
│   └── iam/                  # Roles and access control
│
└── environments/             # Per-environment configs
    ├── dev/                  # Development setup
    └── prod/                 # Production setup
```

---

## ⚙️ Technologies Used
- **Terraform** (modular setup)
- **AWS VPC, EC2, RDS, S3, DynamoDB, Cognito, IAM, CloudWatch**

---

## 🚀 Deployment Steps
```bash
# 1. Navigate to root directory
cd timedoctor-infra/

# 2. Initialize terraform
terraform init

# 3. Preview infrastructure
terraform plan -var-file="environments/dev/terraform.tfvars"

# 4. Apply infrastructure
terraform apply -var-file="environments/dev/terraform.tfvars"
```

---

## 📥 Download File
[Click here to download the file from Mega.nz](https://mega.nz/file/ABC12345#XYZ987654abc)

---

## 🧠 Notes
- `terraform.tfvars` holds environment-specific values.
- `dev` and `prod` folders have same structure with different values.
- Modules are reusable and production-ready.

---

## 👨‍💻 Author
**Yogeshwar Saini**  
Infrastructure Architect – Time Doctor Clone Project
