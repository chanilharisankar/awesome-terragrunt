locals {
  env                       = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment               = basename(dirname(find_in_parent_folders("env.hcl")))
  default_module_name       = basename(get_original_terragrunt_dir())
  module_inputs             = read_terragrunt_config("${get_original_terragrunt_dir()}/input.hcl").inputs
  module_name_override      = try(local.module_inputs.module_name_override, null)
  module_name               = local.module_name_override == null ? local.default_module_name : "${local.module_name_override}-${local.default_module_name}"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = templatefile(
          "templates/s3.tf",
            {
              module         = local.module_name
              environment    = local.environment
            }
          )
}