variable "context" {
  description = "Kubernetes cluster context"
  type        = string
}

variable "namespace" {
  description = "Namespace for chart deploy"
  type        = string
  default     = "default"
}

variable "create_namespace" {
  description = "Create the namespace if it does not yet exist"
  type        = string
  default     = false
}

variable "timeout" {
  description = "Timeout for chart deploy"
  type        = number
  default     = 600
}

variable "replace" {
  description = "Re-use the given name, only if that name is a deleted release which remains in the history"
  type        = bool
  default     = false
}

variable "force_update" {
  description = "Force resource update through delete/recreate if needed"
  type        = bool
  default     = false
}

variable "recreate_pods" {
  description = "Perform pods restart during upgrade/rollback"
  type        = bool
  default     = false
}

variable "atomic" {
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used"
  type        = bool
  default     = false
}

variable "repository" {
  description = "Link to helm repository"
  type        = string
  default     = ""
}

variable "release_name" {
  description = "Helm release name"
  type        = string
}

variable "chart_name" {
  description = "Chart name in repository"
  type        = string
}

variable "chart_version" {
  description = "Chart version to use"
  type        = string
}

variable "values" {
  description = "Helm Chart values in the raw yaml-string"
  type        = list(string)
  default     = []
}
