# AWS EC2 Multi-Instance Provisioning using Terraform

A lightweight Infrastructure as Code (IaC) project built with **Terraform** to dynamically provision multiple Linux EC2 instances on AWS based on environment variables.

---

## 🚀 Features

- **Conditional Instance Sizing:** Automatically selects instance types (`t3.micro` for development/staging vs. `t3.small` for production) using ternary expressions.
- **Dynamic Multi-Instance Scaling:** Utilizes `count.index` to launch multiple EC2 instances sequentially with formatted resource tags (`My_server_0`, `My_server_1`, etc.).
- **Structured Metadata Outputs:** Extracts and displays Instance IDs, Public IPs, and Name tags using Terraform splat operators and `for` expressions.

---

## 📁 Repository Structure

```text
.
├── main.tf          # Core infrastructure logic (EC2 instances & tags)
├── variables.tf     # Variable declarations (environment, instance_count)
├── output.tf        # Output expressions for IDs, Public IPs, and Tags
├── terraform.tfvars # Input variable values (ignored in version control)
└── README.md        # Project documentation


