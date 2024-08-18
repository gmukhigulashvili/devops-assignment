
terraform {
  required_providers {

    helm = {
      source = "hashicorp/helm"
    }
  }
}

# Placeholder provider configuration
provider "helm" {}



# Calling the module with placeholder providers and required inputs
module "this" {
  source = "../"

  chart_name    = "my-chart"
  chart_version = "1.0.0"
  release_name  = "my-chart"
  context       = "local"


}
