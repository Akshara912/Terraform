# 02 - Security (VPC, Subnet & Security Group)

This module provisions core AWS networking and security infrastructure using **Terraform**, including a Virtual Private Cloud (VPC), subnet, and a dynamically configured Security Group with inbound and outbound traffic rules.

---

## 🛠 What This Creates

- **VPC (`aws_vpc`):** Base network layer provisioned with a configurable CIDR block.
- **Subnet (`aws_subnet`):** Isolated subnet carved directly from the VPC's CIDR range.
- **Security Group (`aws_security_group`):** Associated with the VPC, named and described dynamically based on the target environment.
- **Inbound Rules (`aws_vpc_security_group_ingress_rule`):** Dynamically allows TCP traffic on multiple ports (e.g., `22` for SSH, `80` for HTTP) using a `for_each` loop over a list variable.
- **Outbound Rule (`aws_vpc_security_group_egress_rule`):** Allows all unrestricted outbound traffic (`ip_protocol = "-1"`).

---

## 📁 File Structure

| File | Purpose |
| :--- | :--- |
| `provider.tf` | AWS provider configuration and required versions |
| `main.tf` | Core infrastructure resources (VPC, Subnet, Security Group, Ingress, and Egress rules) |
| `variable.tf` | Input variable declarations (`vpc_cidr`, `subnet_cidr`, `environment`, `rule_port`) |
| `terraform.tfvars` | Environment-specific input variable values |

---

## 📋 Input Variables

| Name | Description | Type |
| :--- | :--- | :--- |
| `vpc_cidr` | Base CIDR block for the VPC | `string` |
| `subnet_cidr` | CIDR block for the subnet | `string` |
| `environment` | Deployment environment (`dev`, `staging`, `prod`) | `string` |
| `rule_port` | List of inbound TCP ports to allow | `list(number)` |

---

