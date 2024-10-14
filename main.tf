terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
  }
}

provider "null" {}

locals {
  ssh_private_key = var.ssh_private_key
}

resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!'"
  }
}

resource "local_file" "private_key_file" {
  count    = local.ssh_private_key != "" ? 1 : 0
  content  = base64decode(local.ssh_private_key)
  filename = "outputs/cdp_provisioned_keypair_private.pem"
  file_permission = "0600"
}
