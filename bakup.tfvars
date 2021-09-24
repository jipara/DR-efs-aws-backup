backup_vault_name     = "source"
kms_key_arn           = "arn:aws:kms:us-east-1:11111111111:key/mrk-82d874865c0148ea97a64635767c08ca"
backup_plan_name      = "EFS-to-DR"
rule_name             = "tf_efs_backup_rule"
target_vault_name     = "EFS-Backup"
schedule              = "cron(0 12 * * ? *)"
destination_vault_arn = "arn:aws:backup:us-west-1:222222222222:backup-vault:us-west-1-destination-vault"
tags = {
  name        = "efs-with-terraform"
  environment = "test"
}

