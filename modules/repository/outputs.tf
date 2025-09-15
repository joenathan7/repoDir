# Output values for the repository module

output "repository_name" {
  description = "Name of the created repository"
  value       = github_repository.repo.name
}

output "repository_url" {
  description = "URL of the created repository"
  value       = github_repository.repo.html_url
}

output "repository_id" {
  description = "ID of the created repository"
  value       = github_repository.repo.id
}

output "readme_file_path" {
  description = "Path to the README file in the repository"
  value       = github_repository_file.readme.file
}

output "gitignore_file_path" {
  description = "Path to the .gitignore file in the repository"
  value       = github_repository_file.gitignore.file
}
