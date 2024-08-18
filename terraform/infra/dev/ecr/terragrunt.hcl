terraform {
  source = "../../../modules/ecr"
}
include {
  path = find_in_parent_folders()
}
inputs = {
  aws_region      = "eu-central-1"  # Specify the desired AWS region here
  name            = "dev-vi-ecr"
  repository_type = "private"
  
  catalog_description       = "Dev Docker container registry"
  catalog_about_text        = "This repository hosts dev images for Project VI."
  catalog_usage_text        = "Use these images as per the project guidelines."
  catalog_operating_systems = ["Linux"]
  catalog_architectures     = ["x86_64"]

  repository_lifecycle_policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 50 tagged images",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["dev"],
        "countType": "imageCountMoreThan",
        "countNumber": 50
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Remove untagged images after 60 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 60
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF

  scan_on_push    = false
  encryption_type = "AES256"
  tags = {
    Environment = "dev"
    Project     = "vi-app"
  }
}
