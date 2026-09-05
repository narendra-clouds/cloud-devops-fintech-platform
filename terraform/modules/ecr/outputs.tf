output "repository_urls" {
  description = "URLs of the created ECR repositories"
  value       = { for repo in aws_ecr_repository.repos : repo.name => repo.repository_url }
}