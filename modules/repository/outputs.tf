# Output values for the repository module

output "repository_name" {
  description = "Name of the created repository"
  value       = git_repository.repo.name
}

output "repository_url" {
  description = "URL of the created repository"
  value       = git_repository.repo.url
}

output "readme_file_path" {
  description = "Path to the README file in the repository"
  value       = git_file.readme.file
}

output "gitignore_file_path" {
  description = "Path to the .gitignore file in the repository"
  value       = git_file.gitignore.file
}
