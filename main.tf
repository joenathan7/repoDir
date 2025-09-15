# Main Terraform configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    git = {
      source  = "paultyng/git"
      version = "~> 0.1"
    }
  }
}

# Configure the Git Provider
provider "git" {
  # Git provider configuration
}

# List of repositories to manage
locals {
  repositories = [
    {
      name        = "frontend-app"
      description = "Frontend application repository"
      url         = "https://github.com/your-org/frontend-app.git"
    },
    {
      name        = "backend-api"
      description = "Backend API repository"
      url         = "https://github.com/your-org/backend-api.git"
    },
    {
      name        = "data-pipeline"
      description = "Data processing pipeline"
      url         = "https://github.com/your-org/data-pipeline.git"
    }
  ]
}

# Create repository modules
module "repository" {
  for_each = { for repo in local.repositories : repo.name => repo }
  source   = "./modules/repository"

  repository_name        = each.value.name
  repository_description = each.value.description
  repository_url         = each.value.url
}
