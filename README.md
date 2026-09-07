# AWS Infrastructure as Code — Terraform Portfolio

Hands-on AWS infrastructure projects built with Terraform, progressing 
from foundational provisioning to a production-style secure network 
architecture.

## Background
Windows Server Administrator (VMware, AD, DNS/DHCP) transitioning into 
cloud/DevOps engineering. This repo documents self-directed Terraform/AWS 
learning through hands-on projects — clearly distinguished from 
production work experience.

## Projects

### [01 — EC2 Multi-Instance](./01-ec2-multi-instance)
Provisioning multiple EC2 instances dynamically via Terraform.

### [02 — Security (VPC, Subnet & Security Group)](./02-Security)
Core networking and security foundation: VPC, subnet, and a dynamically 
configured Security Group with `for_each`-driven inbound rules (SSH, HTTP) 
and unrestricted outbound.

### [03 — IAM (User & Policy Management)](./03-IAM)
Dynamically provisions multiple IAM users using `count`, with inline 
policies attached from an external JSON file.

### [04 — EC2 Multi-Instance with Function](./04-EC2-multi-instance-with-function)
Dynamic AMI mapping by region, environment-based instance sizing 
(`t3.small` for Production, `t3.micro` otherwise), and count-based 
multi-instance deployment with timestamped resource tagging.

### [05 — EC2 with Latest AMI in the Region](./05-EC2-with-latest-ami-in-the-region)
Uses a Terraform data source to dynamically fetch the latest AMI matching 
a filter, rather than hardcoding an AMI ID.

### [06 — Security Group Rule for Multiple Ports](./06-Security-group-rule-for-multiple-port)
Dynamically attaches inbound rules for multiple ports (FTP, SSH, HTTPS, 
SMB, etc.) to a single security group using `for_each` over a port list.

### [07 — 3-Tier AWS Bastion Architecture](./07-aws-3tier-bastion-architecture)
Production-style secure network design:
- Public/private subnet separation across 3 tiers (Bastion / App / DB)
- Bastion host as the sole RDP entry point
- NAT Gateway for outbound-only private subnet internet access
- Layered security groups using SG-to-SG references — DB reachable only 
  from App tier, App only from Bastion

## Tech Stack
Terraform · AWS (VPC, EC2, NAT Gateway, IGW, Security Groups, IAM, S3, 
DynamoDB) · Windows Server

## Notes
Each project folder has its own README with detailed architecture, file 
structure, and input variables.
