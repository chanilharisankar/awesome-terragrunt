resource "null_resource" "config_generator" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo ${var.test_variable}"
  }
}