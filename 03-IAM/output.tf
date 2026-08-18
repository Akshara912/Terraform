output "users" {
    value = "${aws_iam_user.dev[*].name}"
  
}