# 3-Tier AWS Architecture with Bastion Host

This module provisions a highly secure, isolated 3-tier AWS network infrastructure using Terraform. The architecture segregates public entry points from private application and database workloads, utilizing a Windows Bastion Host for secure administrative access.

---

## 📐 Architecture Diagram & Overview

```text
VPC (myVPC)
├── PublicSubnet
│   ├── Internet Gateway (myIGW)
│   ├── Bastion EC2 (myec2) — Windows, Public IP, RDP Entry Point
│   ├── NAT Gateway (myNat) + Elastic IP (elip)
│   └── Public Route Table (pubrt) → 0.0.0.0/0 → IGW
├── PrivateSubnet-App
│   ├── App EC2 (APPEC2) — Windows, Private IP
│   └── Private Route Table → 0.0.0.0/0 → NAT Gateway
└── PrivateSubnet-DB
    └── DB EC2 (DBEC2) — Windows, Private IP

Key Components
Virtual Private Cloud (VPC): Multi-subnet layout providing complete network isolation.

Public Subnet: Hosts the Internet Gateway, NAT Gateway, and a Windows Bastion server (myec2) exposed for RDP access.

Private App Subnet: Houses internal Windows Application EC2 instances (APPEC2) routed through the NAT Gateway for outbound connectivity.

Private DB Subnet: Strictly isolated subnet reserved for database instances (DBEC2) with no direct internet ingress.

🛠️ File Structure
main.tf - Core configuration and resource dependencies.

vpc.tf - VPC, Subnets, Internet Gateway, Elastic IP, and NAT Gateway configurations.

compute.tf - Windows EC2 instances for Bastion, App, and DB tiers.

RouteTable.tf - Route tables and subnet association definitions.

Variable.tf - Input variable definitions (region, CIDR blocks, AMI IDs, instance types).

terraform.tfvars - Environment-specific variable assignments.

provider.tf - AWS Provider configuration and required versions.

output.tf - Exposed outputs (Public IP of Bastion, Private IPs of App/DB servers).

🚀 Deployment Instructions
Prerequisites
Terraform CLI (v1.0+) installed.

AWS CLI installed and configured (aws configure).
