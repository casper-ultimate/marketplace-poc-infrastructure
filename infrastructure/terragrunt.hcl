locals {
  parsed = "dev"
  env    = local.parsed
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
      profile = "default"
      region  = "us-east-1"
  }
EOF
}

# Configure S3 as a backend
remote_state {
  backend = "s3"
  config = {
    bucket = "bucket-e43a1b71-6ef4-4412-9a22-7ba5e952f1c0-${local.env}"
    region = "us-east-1"
    key    = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}