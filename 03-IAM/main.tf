resource "aws_iam_user" "dev" {
    name = "${var.environment}-${count.index}"
    count = var.repeat
  
}
resource "aws_iam_user_policy" "role" {
    user = aws_iam_user.dev[count.index].name
    count = var.repeat
    policy = file("./policy.json")
  
}