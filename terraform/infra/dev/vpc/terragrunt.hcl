include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git//?ref=v5.0.0"

  extra_arguments "init_args" {
    commands = [
      "init"
    ]
    arguments = [
    ]
  }
}

inputs = {
  name = "vi-dev-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["192.168.0.0/24", "192.168.1.0/24"]
  public_subnets  = ["192.168.10.0/24", "192.168.20.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  map_public_ip_on_launch = true

  tags = {
    Terraform = "true"
    Environment = "lab"
  }
}