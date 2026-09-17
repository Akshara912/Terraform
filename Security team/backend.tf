terraform {
  backend "s3" {

    bucket = "mybackened-bucket"
    key = "backened for sec"
    use_lockfile = true
    region = "ap-south-1"
    
  }
}