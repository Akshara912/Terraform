# AWS & Terraform Infrastructure Portfolio

This repository contains multi-environment Terraform configurations and modules designed to automate AWS infrastructure deployments.

---

## 📁 Repository Structure

* `01-ec2-multi-instance/` - Provisioning multiple EC2 instances using count and for_each loops.
* `02-Security/` - AWS Security Groups and ingress/egress firewall configurations.
* `03-IAM/` - IAM Roles, Policies, and User management.
* `04-EC2-multi-instance-with function/` - Dynamic EC2 provisioning using built-in Terraform functions.
* `05-EC2 with latest ami in the region/` - Dynamically fetching the latest Windows/Linux AMI via AWS Data Sources.
* `06-Security group rule for multiple port/` - Multi-port security group rules using dynamic blocks.
* `07-aws-3tier-bastion-architecture/` - 3-Tier VPC Architecture featuring Public/Private Subnets, NAT Gateway, Bastion Host (RDP access), and Application/Database tiers.

---

## 🛠️ Prerequisites

Before executing any module, ensure you have:

* [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) (v1.0+)
* [AWS CLI](https://aws.amazon.com/cli/) configured with proper IAM permissions (`aws configure`)

---

## 🚀 How to Run

1. Navigate to the desired module directory:
   ```bash
   cd 07-aws-3tier-bastion-architecture
