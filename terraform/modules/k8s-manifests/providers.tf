# Configuring versions of terraform and terraform providers
terraform {
  required_version = "~> 1.5.3"
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
  }
}
