terraform {
  backend "s3" {

    bucket = "mybackened-bucket"
    region = "ap-south-1"
    use_lockfile = true
    key = "myS3"
  }
}