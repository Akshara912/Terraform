# AWS Security Group Ingress Rules (Terraform)

This Terraform project provisions an AWS Security Group (`SG1`) and dynamically creates inbound (ingress) firewall rules for a specified set of TCP ports using the `aws_vpc_security_group_ingress_rule` resource.

---

## Overview

The configuration consists of two primary components:
1. **Security Group (`aws_security_group`)**: Creates a security group named `SG1`.
2. **Ingress Rules (`aws_vpc_security_group_ingress_rule`)**: Iterates over a list of port numbers using `for_each` and attaches inbound TCP rules for each specified port from a given IPv4 CIDR block.

---

## Code Breakdown

### `main.tf`

```hcl
# Create a Security Group named SG1
resource "aws_security_group" "SG1" {
  name = "SG1"
}

# Enable specified ingress ports from a target CIDR IP range
resource "aws_vpc_security_group_ingress_rule" "rule" {
  security_group_id = aws_security_group.SG1.id
  for_each          = toset([for p in var.pts : tostring(p)])
  from_port         = each.value
  to_port           = each.value
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ip
}
```

---

## Requirements & Variables

To run this Terraform module, define the following variables in your `variables.tf` file or pass them via a `terraform.tfvars` file:

### `variables.tf`

```hcl
variable "pts" {
  type        = list(number)
  description = "List of ports to allow ingress TCP traffic for."
  default     = [9100, 3389, 443, 445, 22, 21, 20]
}

variable "ip" {
  type        = string
  description = "IPv4 CIDR block allowed to connect to the specified ports."
  default     = "0.0.0.0/0"  # Update with your specific IP range (e.g., "10.0.0.0/16")
}
```

---

## Configured Ports

| Port | Description |
| :--- | :--- |
| `20` | FTP - Data Transfer |
| `21` | FTP - Control |
| `22` | SSH / SFTP |
| `443` | HTTPS |
| `445` | SMB / Microsoft Directory Services |
| `3389` | Remote Desktop Protocol (RDP) |
| `9100` | Prometheus Node Exporter / PDL Data Stream |

---

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Review Execution Plan:**
   ```bash
   terraform plan -var='ip=192.168.1.0/24'
   ```

3. **Apply Changes:**
   ```bash
   terraform apply -var='ip=192.168.1.0/24'
   ```

4. **Clean Up Resources:**
   ```bash
   terraform destroy
   ```

---

## Prerequisites

* **Terraform**: `>= 1.0.0`
* **AWS Provider**: `hashicorp/aws` (`>= 4.0.0`)
* Configured AWS CLI credentials (`aws configure`)
