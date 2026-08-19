# AWS EC2 Terraform Infrastructure

This Terraform module provisions dynamic AWS EC2 instances (`aws_instance.prjct`) based on specified variables and input configurations.

## Features

* **Dynamic AMI Mapping:** Selects the AMI dynamically from a map (`var.image`) based on the target region (`var.reg`).
* **Environment-Based Sizing:** Sets `instance_type` conditionally:
  * `t3.small` if `var.environment == "Production"`
  * `t3.micro` for non-Production environments
* **Multi-Instance Deployment:** Deploys a count of instances equal to the length of `var.def`.
* **Resource Tagging:**
  * Assigns names based on `var.def` elements (`element(var.def, count.index)`).
  * Timestamps deployments using `formatdate` and `timestamp()`.

---

## Prerequisites

* [Terraform](https://www.terraform.io/downloads.html) (>= 0.12)
* AWS CLI configured with valid credentials and permissions to manage EC2 instances

---

## File Structure

```text
├── provider.tf        # AWS Provider configuration
├── main.tf            # Main EC2 instance resource definitions
├── variable.tf        # Input variable declarations
└── terraform.tfvars   # Variable definitions and overrides
