# Configuring versions of terraform and terraform providers
terraform {
  required_version = "~> 1.5.3"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13.2"
    }
  }
}
