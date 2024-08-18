variable "context" {
  description = "Kubernetes cluster context"
  type        = string
}

variable "manifests" {
  description = "Kubernetes Manifests settings"
  type = object({
    content          = string                 # Kubernetes Manifests content
    sensitive_fields = optional(list(string)) # Kubernetes Manifests sensitive fields. This allows to hide arbitrary field content by suppressing the information in the diff
  })
}
