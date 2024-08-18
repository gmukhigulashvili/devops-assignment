module "dynamodb_table_tfstate_lock" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = ">= 3.1.2, < 3.2.0"

  name         = "lab-tfstate-lock"
  billing_mode = "PROVISIONED"

  server_side_encryption_enabled     = true
  server_side_encryption_kms_key_arn = module.kms_tfstate.key_arn

  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  tags = {
    Environment = "dev"
    Terraformed = "True"
  }
}
