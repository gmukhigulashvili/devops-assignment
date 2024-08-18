# AWS ECR repository
resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  tags                 = var.tags

  # Encryption configuration
  encryption_configuration {
    encryption_type = var.encryption_type
  }
}

# Attach a lifecycle policy to the ECR repository
resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = var.repository_lifecycle_policy
}

resource "aws_ecrpublic_repository" "this_public" {
  count           = var.repository_type == "public" ? 1 : 0
  repository_name = var.name

  catalog_data {
    description       = var.catalog_description
    about_text        = var.catalog_about_text
    usage_text        = var.catalog_usage_text
    operating_systems = var.catalog_operating_systems
    architectures     = var.catalog_architectures
  }

  tags = var.tags
}