locals {
    parent_terragrunt_dir = get_parent_terragrunt_dir()
    default_module_name   = basename(path_relative_to_include())
    common_input          = try(read_terragrunt_config("${dirname(find_in_parent_folders())}/common/input.hcl"), {})
    environment_name      = try(basename(dirname(find_in_parent_folders("env.hcl"))), "env")
    environment_overrides = try(read_terragrunt_config(find_in_parent_folders("env.hcl")), {})
    module_secrets        = try(yamldecode(sops_decrypt_file("${get_original_terragrunt_dir()}/secrets.yaml")), {})
    module_configs        = try(yamldecode(file("${get_original_terragrunt_dir()}/configs.yaml")), {})
    module_input          = try(read_terragrunt_config("${get_original_terragrunt_dir()}/input.hcl"), {})
    module_local_input    = try(read_terragrunt_config("${get_original_terragrunt_dir()}/input.local.hcl"), {})
    cluster_input         = try(read_terragrunt_config(find_in_parent_folders("cluster.hcl")), {})
    provider              = try(local.input.provider, "common")
    override_environment  = try(local.module_input.inputs.override_environment, false)
    env_path              = local.override_environment ? local.environment_name : "env"
    module_name_override  = try(local.module_input.inputs.module_name_override, null)
    module_name           = coalesce(local.module_name_override, local.default_module_name)

    input = merge(
        try(local.common_input.inputs, {}),
        try(local.environment_overrides.inputs, {}),
        try(local.module_local_input.inputs, {}),
        try(local.module_configs, {}),
        try(local.module_secrets, {}),
        try(local.cluster_input.inputs, {}),
        try(local.module_input.inputs, {})
    )

    module_path = join("/", [
        local.parent_terragrunt_dir,
        "..",
        "/modules",
        "infrastructure",
        local.provider,
        local.module_name,
  ])
}
inputs = local.input
terraform {
    source = local.module_path
}

