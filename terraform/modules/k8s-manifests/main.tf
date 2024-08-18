# Getting the contents of manifests
data "kubectl_file_documents" "this" {
  content = var.manifests.content
}

# Creating Kubernetes Manifest
resource "kubectl_manifest" "this" {
  for_each         = data.kubectl_file_documents.this.manifests
  sensitive_fields = var.manifests.sensitive_fields
  yaml_body        = each.value
}
