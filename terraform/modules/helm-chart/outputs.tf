output "helm_release_repository" {
  description = "Helm release Repository"
  value       = helm_release.this.repository
}

output "helm_release_chart_name" {
  description = "Helm release Chart name"
  value       = helm_release.this.chart
}

output "helm_release_chart_version" {
  description = "Helm release Chart version"
  value       = helm_release.this.version
}

output "helm_release_name" {
  description = "Helm release name"
  value       = helm_release.this.name
}

output "helm_release_namespace" {
  description = "Helm release namespace"
  value       = helm_release.this.namespace
}

output "helm_release_manifest" {
  description = "The rendered manifest of the release as JSON"
  value       = helm_release.this.manifest
}
