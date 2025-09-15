

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}

# GitHub repository resource
resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = "public"
  auto_init   = true
}

# Add a README file to the repository
resource "github_repository_file" "readme" {
  repository          = github_repository.repo.name
  file                = "README.md"
  content             = <<-EOT
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
  commit_message      = "Add README.md via Terraform"
  commit_author       = "Terraform"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

# Add a .gitignore file
resource "github_repository_file" "gitignore" {
  repository          = github_repository.repo.name
  file                = ".gitignore"
  content             = <<-EOT
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
  commit_message      = "Add .gitignore via Terraform"
  commit_author       = "Terraform"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}
