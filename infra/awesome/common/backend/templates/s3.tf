terraform {
  backend "s3" {
    bucket         = "awesome-terragrunt-project-tf-state"
    key            = "${environment}/${module}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}