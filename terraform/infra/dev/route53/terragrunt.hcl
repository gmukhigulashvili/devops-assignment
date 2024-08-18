terraform {
  source = "../../../modules/route53"
}
include {
  path = find_in_parent_folders()
}

inputs = {
  region    = "eu-central-1"
  zone_name = "chene-factory.com" 
  comment   = "Managed by Terragrunt"
  tags = {
    Environment = "dev"
    ManagedBy   = "Terragrunt"
  }

}
