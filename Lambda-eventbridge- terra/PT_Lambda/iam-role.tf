resource "aws_iam_role" "iam-role" {
  name               = "Lambda-execution-role"
  assume_role_policy = file("${path.module}/iam-role.json")
}