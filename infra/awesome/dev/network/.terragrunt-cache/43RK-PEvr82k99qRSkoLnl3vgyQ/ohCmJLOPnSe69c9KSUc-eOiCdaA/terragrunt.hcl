terraform {
  source = "../../../modules/infrastructure/aws/network"
}
include "s3_backend" {
  path = "../../common/backend/s3.hcl"
}
inputs = {
    test_variable = "from terragrunt inputs"
    vpc_name = "awesome_vpc"
}
