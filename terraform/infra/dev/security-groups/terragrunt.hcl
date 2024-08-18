terraform {
  source = "../../../modules/k8s-manifests"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  context = "arn:aws:eks:eu-central-1:851725552187:cluster/eks-cluster-vi-dev"  

  manifests = {
    content          = file("templates/controller.yaml")
    sensitive_fields = []
  }
}