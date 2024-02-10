# resource "aws_amplify_app" "power_of_math2" {
#   name       = "power_of_math2"
#   repository = "https://github.com/mickleissa/amplify_app"
#   access_token = "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"
#     # enable_basic_auth      = true
# #   basic_auth_credentials = base64encode("mickleissa:Mickleissa381986@")

#   # The default build_spec added by the Amplify Console for React.
#   build_spec = <<-EOT
#     version: 0.1
#     frontend:
#       phases:
#         preBuild:
#           commands:
#             - yarn install
#         build:
#           commands:
#             - yarn run build
#       artifacts:
#         baseDirectory: build
#         files:
#           - '**/*'
#       cache:
#         paths:
#           - node_modules/**/*
#   EOT

#   # The default rewrites and redirects added by the Amplify Console.
#   custom_rule {
#     source = "/<*>"
#     status = "404"
#     target = "/index.html"
#   }

#   environment_variables = {
#     ENV = "test"
#   }
# }