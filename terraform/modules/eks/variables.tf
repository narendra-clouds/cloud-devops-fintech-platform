variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "fintech-eks-cluster"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets for EKS worker nodes"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "IDs of public subnets for EKS Control Plane endpoints"
  type        = list(string)
}