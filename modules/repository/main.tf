# Repository module
terraform {
  required_providers {
    git = {
      source  = "paultyng/git"
      version = "~> 0.1"
    }
  }
}

# Variables
variable "repository_name" {
  description = "Name of the repository"
  type        = string
}

variable "repository_description" {
  description = "Description of the repository"
  type        = string
}

variable "repository_url" {
  description = "URL of the repository"
  type        = string
}

# Git repository resource
resource "git_repository" "repo" {
  name = var.repository_name
  url  = var.repository_url
}

# Add a file to the repository using git_file resource
resource "git_file" "readme" {
  repository = git_repository.repo.name
  file       = "README.md"
  content    = <<-EOT
# 



This repository is managed by Terraform.

## Getting Started

This repository was created and configured using Terraform infrastructure as code.

## Repository Information

- **Name**: 
- **Description**: 
- **URL**: 
- **Created**: 

## Files

This repository includes:
- README.md (this file)
- .gitignore (if configured)
- Additional files as managed by Terraform

EOT
}

# Add a .gitignore file
resource "git_file" "gitignore" {
  repository = git_repository.repo.name
  file       = ".gitignore"
  content    = <<-EOT
# Terraform
*.tfstate
*.tfstate.*
.terraform/
.terraform.lock.hcl

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Dependencies
node_modules/
vendor/

# Environment files
.env
.env.local
.env.*.local
EOT
}
