provider "aws" {
  region                      = var.aws_region
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    lambda = var.localstack_endpoint
    sqs    = var.localstack_endpoint
    iam    = var.localstack_endpoint
  }
}