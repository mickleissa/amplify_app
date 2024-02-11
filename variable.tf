variable "token" {
  type        = string
  description = "github token to connect github repo"
  default     = "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"
}

variable "repository" {
  type        = string
  description = "github repo url"
  default     = "https://github.com/mickleissa/amplify_app"
}

variable "app_name" {
  type        = string
  description = "AWS Amplify App Name"
  default     = "power_of_math_2"
}

variable "branch_name" {
  type        = string
  description = "AWS Amplify App Repo Branch Name"
  default     = "master"
}


variable "domain_name" {
  type        = string
#   default     = "awsamplifyapp.com"
  default     = "mickleissa.com"
  description = "AWS Amplify Domain Name"
}
# variable "build_spec_content" {
#   default     = "true"
#   type        = string
#   description = "Your build spec file contents. If not provided then it will use the `amplify.yml` at the root of your project / branch."
# }