# AWS EC2 Instance Terraform Configuration

This Terraform project provisions a single AWS EC2 instance (`aws_instance.MyEc2`) using the latest AWS Elastic Beanstalk Amazon Machine Image (AMI) fetched dynamically from AWS.

## Architecture & Code Breakdown

* **Data Source (`data.aws_ami.def`):** Looks up the most recent official Amazon AMI matching the filter `aws-elasticbeanstalk-amzn-*`.
* **Resource (`aws_instance.MyEc2`):** Provisions a `t3.micro` EC2 instance using the dynamically retrieved `data.aws_ami.def.image_id`.
  * **Tags:**
    * `Name` = `"My_EC2"`
    * `Team` = `"Production"`
* **Outputs:**
  * `details`: Exports the value of `var.reg`.
  * `id`: Exports the instance ID (`aws_instance.MyEc2.id`).

---

## File Structure

```text
├── main.tf            # AMI data source, EC2 instance, and output definitions
├── variable.tf        # Variable declarations (includes var.reg)
├── provider.tf        # AWS Provider configuration
└── terraform.tfvars   # Input values for variables
