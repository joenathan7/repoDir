# Frontend App Repository
module "frontend_app" {
  source = "./modules/repository"

  repository_name        = "frontend-app"
  repository_description = "Frontend application repository"
  repository_url         = "https://github.com/your-org/frontend-app.git"
  github_token           = var.github_token
}

# Backend API Repository
module "backend_api" {
  source = "./modules/repository"

  repository_name        = "backend-api"
  repository_description = "Backend API repository"
  repository_url         = "https://github.com/your-org/backend-api.git"
  github_token           = var.github_token
}

# Data Pipeline Repository
module "data_pipeline" {
  source = "./modules/repository"

  repository_name        = "data-pipeline"
  repository_description = "Data processing pipeline"
  repository_url         = "https://github.com/your-org/data-pipeline.git"
  github_token           = var.github_token
}
