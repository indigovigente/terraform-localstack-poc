variable "project" {
  type    = string
  default = "localstack-demo"
}


variable "localstack_endpoint" {
  type        = string
  default     = "http://localhost:4566"
}

variable "aws_access_key" {
  type        = string
  default     = "test"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  default     = "test"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}