module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  public_dedicated_network_acl = true
  private_dedicated_network_acl = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags
}