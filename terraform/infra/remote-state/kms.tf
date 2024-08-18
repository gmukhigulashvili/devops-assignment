module "kms_tfstate" {
  source  = "terraform-aws-modules/kms/aws"
  version = ">= 1.5.0, < 1.6.0"

  aliases = [
    "alias/s3/lab/tfstate"
  ]

  tags = {
    Environment = "dev"
    Terraformed = "True"
  }
}
