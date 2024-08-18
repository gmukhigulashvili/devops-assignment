include {
  path = find_in_parent_folders()
}

generate "provider-local" {
  path      = "provider-local.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

    data "aws_eks_cluster" "eks" {
        name = aws_eks_cluster.this[0].id
    }

    data "aws_eks_cluster_auth" "eks" {
        name = aws_eks_cluster.this[0].id
    }

    provider "kubernetes" {
        host                   = data.aws_eks_cluster.eks.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
        token                  = data.aws_eks_cluster_auth.eks.token
    }
EOF
}


terraform {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git//?ref=v20.23.0"

  extra_arguments "init_args" {
    commands = [
      "init"
    ]
    arguments = [
    ]
  }
}


dependencies {
  paths = ["../vpc"]
}

dependency "vpc" {
  config_path = "../vpc"  
}



inputs = {

  cluster_name    = "eks-cluster-vi-dev"
  cluster_version = "1.30"

  cluster_endpoint_public_access  = true


  vpc_id                   = dependency.vpc.outputs.vpc_id
  subnet_ids               = dependency.vpc.outputs.public_subnets
  control_plane_subnet_ids = dependency.vpc.outputs.private_subnets

  # EKS Managed Node Group(s)
  

  eks_managed_node_groups = {
    green = {
      min_size     = 3
      max_size     = 4
      desired_size = 4

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
    }
  }

  enable_cluster_creator_admin_permissions = true

  # aws-auth configmap
  manage_aws_auth_configmap = true

  # IAM Role Configuration
  create_iam_role       = true
  iam_role_name         = "my-eks-node-group-role"

  # Load Balancer and Elastic IP Configuration
  aws_lb_controller = {
    create                = true
    subnet_ids            = dependency.vpc.outputs.public_subnets
    cluster_name          = "eks-cluster-vi-dev"
    vpc_id                = dependency.vpc.outputs.vpc_id
    enable_waf            = false  
    attach_eip            = true  
    eip_allocation_ids    = ["eipalloc-09c7ca7d0423eccdd", "eipalloc-03d316ae4f79fd844"]  
  }

  # Autoscaling Group Schedule
  create_schedule = true
  schedules       = {
    "scale-up-morning" = {
      desired_capacity = 1
      min_size         = 1
      max_size         = 2
      start_time       = "2023-08-01T06:00:00Z"
      end_time         = "2023-08-01T18:00:00Z"
      recurrence       = "0 6 * * 1-5"  # Weekdays at 06:00 AM UTC
    }
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}