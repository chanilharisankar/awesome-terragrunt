include "s3_backend" {
  path = "../../common/backend/s3.hcl"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

inputs = {
    test_variable = "from terragrunt inputs"
    vpc_name      = "awesome_vpc"
}