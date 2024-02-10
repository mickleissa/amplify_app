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