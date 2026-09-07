# 03 - IAM (User & Policy Management)

This module provisions AWS Identity and Access Management (IAM) infrastructure using **Terraform**. It dynamically creates multiple IAM users and attaches inline policies loaded from an external JSON file.

---

## 🛠 What This Creates

- **IAM Users (`aws_iam_user`):** Provisions a configurable number of IAM users (`var.repeat`) dynamically named using string interpolation and `count.index` (e.g., `dev-0`, `dev-1`).
- **Inline Policies (`aws_iam_user_policy`):** Creates and attaches an inline IAM policy to each user by indexing the corresponding IAM user (`aws_iam_user.dev[count.index].name`) and loading permissions from `./policy.json`.

---

## 📁 File Structure

| File | Purpose |
| :--- | :--- |
| `main.tf` | Defines the `aws_iam_user` and `aws_iam_user_policy` resources using `count` |
| `policy.json` | IAM policy definition in JSON format loaded via `file()` function |
| `variable.tf` | Input variable declarations (`var.environment`, `var.repeat`) |
| `terraform.tfvars` | Environment variable inputs |

---

## 📋 Input Variables

| Name | Description | Type |
| :--- | :--- | :--- |
| `environment` | Target environment identifier used in resource naming (e.g., `dev`, `prod`) | `string` |
| `repeat` | Number of IAM users and matching policies to create | `number` |

---
