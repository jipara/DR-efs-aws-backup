terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"


  # assume_role {
  #   role_arn = var.assume_role_arn
  #   external_id = var.external_id
  # }
}




resource "aws_backup_vault" "vault-souce" {
  name        = var.backup_vault_name
  kms_key_arn = var.kms_key_arn
  tags        = var.tags
}

resource "aws_backup_plan" "EFS-to-DR" {
  name = var.backup_plan_name

  rule {
    rule_name         = var.rule_name
    target_vault_name = var.target_vault_name
    schedule          = var.schedule
    copy_action {
      destination_vault_arn = var.destination_vault_arn
    }
  }
}
resource "aws_backup_selection" "example" {
  iam_role_arn = "arn:aws:iam::111111111111:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup"
  name         = "AWSServiceRoleForBackup"
  plan_id      = aws_backup_plan.EFS-to-DR.id

  resources = [
    "arn:aws:elasticfilesystem:us-east-1:1111111111111:file-system/fs-463b39f2"
  ]
}
