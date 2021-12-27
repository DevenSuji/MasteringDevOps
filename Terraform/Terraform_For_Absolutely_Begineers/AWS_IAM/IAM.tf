resource "aws_iam_user" "admin-user" {
  name = "DrishtiDeven"
  tags = {
    Designation = "CEO"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"
        }
    ]
    }
    EOF
}

resource "aws_iam_policy_attachment" "drishti-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}
