terraform {
  source = "../../../modules/helm-chart"
}

include "state" {
  path = find_in_parent_folders()
}

locals {
  resources_common_name = "argo-cd"
}

inputs = {
  namespace     = "argocd"
  repository    = "https://argoproj.github.io/argo-helm"
  release_name  = local.resources_common_name
  chart_name    = local.resources_common_name
  chart_version = "7.4.4"
  values        = [file("${get_terragrunt_dir()}/templates/values.yaml")]
}