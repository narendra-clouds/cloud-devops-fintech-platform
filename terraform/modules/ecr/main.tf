resource "aws_ecr_repository" "repos" {
  count                = length(var.repository_names)
  name                 = var.repository_names[count.index]
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.environment
  }
}

# Expire old/untagged images to save costs
resource "aws_ecr_lifecycle_policy" "policy" {
  count      = length(var.repository_names)
  repository = aws_ecr_repository.repos[count.index].name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images older than 14 days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 14
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}