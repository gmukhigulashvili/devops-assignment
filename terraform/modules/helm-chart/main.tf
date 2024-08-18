# Creating Helm release
resource "helm_release" "this" {
  name             = var.release_name
  chart            = var.chart_name
  repository       = var.repository
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  timeout          = var.timeout
  replace          = var.replace
  force_update     = var.force_update
  recreate_pods    = var.recreate_pods
  atomic           = var.atomic
  values = [
    file("${path.module}/templates/values.yaml")
  ]
  
}

