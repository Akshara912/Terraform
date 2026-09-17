## Cross-Team Security Group with Remote State Data Source

Terraform project demonstrating cross-team infrastructure referencing using remote state as a data source - a commmon pattern in multiple team AWS environments.


## Architecture

-**network-team/**: Provisions an elastic ip (EIP) and stores its state remotely(S3 backened)
-**security-team/**: Consumes that network team's EIP via "terraform_remote_state" Data source, then dynamically whitelist that IP in a security group ingress rule

This mirros real-world setup where seperate teams own seperate parts of infrastructure but still need to reference each other's output without hardcoding values.

## How it works
1. Network team's terraform config provisions an EIP and outputs its value.
2. Security team's config uses a "terraform_remote_state" Data source pointing to the network team's state file
3. Security group's ingress rule pulls the EIP dynamically from that remote state output and whitelist it  - no manual copy pasting of IP between team.

