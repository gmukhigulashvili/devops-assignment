variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "repository_type" {
  description = "The type of ECR repository (public or private)"
  type        = string
  default     = "private"
}

variable "public_repository_catalog_data" {
  description = "Catalog data for public repositories"
  type        = any
  default     = {}
}

variable "repository_lifecycle_policy" {
  description = "Lifecycle policy for the ECR repository"
  type        = string
  default     = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep only the last 30 images with tag 'v'",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["v"],
        "countType": "imageCountMoreThan",
        "countNumber": 30
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Expire untagged images older than 90 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 90
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}


variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Type of encryption for the ECR repository (AES256 or KMS)"
  type        = string
  default     = "AES256"
}

variable "tags" {
  description = "Tags to apply to the repository"
  type        = map(string)
  default     = {}
}

variable "catalog_description" {
  description = "Description for the public repository"
  type        = string
  default     = ""
}

variable "catalog_about_text" {
  description = "About text for the public repository"
  type        = string
  default     = ""
}

variable "catalog_usage_text" {
  description = "Usage text for the public repository"
  type        = string
  default     = ""
}

variable "catalog_operating_systems" {
  description = "Operating systems supported by the repository"
  type        = list(string)
  default     = ["Linux"]
}

variable "catalog_architectures" {
  description = "Architectures supported by the repository"
  type        = list(string)
  default     = ["x86_64"]
}
