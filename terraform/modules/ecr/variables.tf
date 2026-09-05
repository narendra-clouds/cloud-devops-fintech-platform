variable "repository_names" {
  description = "List of ECR repository names"
  type        = list(string)
  default     = ["auth-service", "catalog-service", "payment-service"]
}

variable "environment" {
  description = "Environment name"
  type        = string
}