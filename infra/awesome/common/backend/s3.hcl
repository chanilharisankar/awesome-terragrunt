generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    backend "s3" {
        bucket         = "awesome-terragrunt-project-tf-state"
        key            = "dev/network/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
    }
}
EOF
}