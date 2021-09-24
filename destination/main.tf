terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "dr-recovery"
}

resource "aws_backup_vault" "vault_destination" {
  name        = var.backup_vault
  kms_key_arn = var.kms_key_arn
}

data "aws_backup_vault" "vault_destination_data" {
  name = "us-west-1-destination-vault"
}
output "vault_destination_data" {
  value = data.aws_backup_vault.vault_destination_data.arn
}
