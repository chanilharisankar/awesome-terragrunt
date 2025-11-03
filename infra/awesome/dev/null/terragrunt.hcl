terraform {
  source = "../../../modules/infrastructure/common/null"
}
include "s3_backend" {
  path = "../../common/backend/s3.hcl"
}
inputs = {
    test_variable = "from terragrunt inputs"
}
