# locals {
#   basic_auth_creds = try(base64encode("${var.basic_auth_username}:${var.basic_auth_password}"), null)
# }

resource "aws_amplify_app" "amplify_app" {
  name       = var.app_name
  repository = var.repository
  oauth_token = var.token 
  build_spec = <<-EOT
  true
  EOT
# build_spec               = var.build_spec_content != "" ? var.build_spec_content : null
  enable_auto_branch_creation = true

  # The default patterns added by the Amplify Console.
  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    # Enable auto build for the created branch.
    enable_auto_build = true
  }
#    iam_service_role_arn     = aws_iam_role.amplify_build_role.arn
}
resource "aws_amplify_branch" "amplify_branch" {
  app_id      = aws_amplify_app.amplify_app.id
  branch_name = var.branch_name
  enable_auto_build = true
    stage = "PRODUCTION"

}
resource "aws_amplify_domain_association" "domain_association" {
  app_id      = aws_amplify_app.amplify_app.id
  domain_name = var.domain_name
  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.amplify_branch.branch_name
    prefix      = var.branch_name
  }

}