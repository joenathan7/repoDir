# Input variables for the repository module

variable "repository_name" {
  description = "Name of the repository"
  type        = string
}

variable "repository_description" {
  description = "Description of the repository"
  type        = string
  default     = ""
}

variable "repository_url" {
  description = "URL of the repository"
  type        = string
}
