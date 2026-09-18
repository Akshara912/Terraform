## Multi-Provider AWS Security Groups Configuration

This Terraform project demonstrates how to deploy AWS resources across multiple regions within a single configuration using AWS provider aliases.

## Overview
The setup provisions two AWS Security Groups in different regions:

**SG1 ("Prod SG")**: Deployed using the aws.Singapore provider alias.

**SG2 ("Dev SG")**: Deployed using the aws.ohio provider alias.

## Prerequisites

Terraform (v0.12 or higher)

AWS CLI installed and configured with valid credentials (aws configure)
