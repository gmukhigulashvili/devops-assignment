output "yaml_body" {
  description = "YAML to apply to Kubernetes"
  value       = [for k in kubectl_manifest.this[*] : { for k1, v1 in k : regex("[^/]+/[^/]+$", k1) => lookup(v1, "yaml_body", "NONE") }][0]
  sensitive   = true
}
