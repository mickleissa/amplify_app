# Create an IAM role for Amplify builds
resource "aws_iam_role" "amplify_build_role" {
  name = "amplify-build-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      }
    ]
  })
}

# Policy

resource "aws_iam_policy" "policy" {
  name        = "amplify_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Resource": [
                "*"
            ],
            "Action": [
                "codecommit:GitPull"
            ]
        }
    ]
  })
}

# Attach necessary permissions to the IAM role for Amplify builds
resource "aws_iam_policy_attachment" "amplify_build_policy_attachment" {
  name       = "amplify-build-policy-attachment"
  policy_arn = aws_iam_policy.policy.arn
  roles      = [aws_iam_role.amplify_build_role.name]
}
