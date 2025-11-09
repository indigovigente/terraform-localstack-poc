data "archive_file" "lambda_a_zip" {
  type        = "zip"
  source_dir  = "../repositories/messaging/lambda-a"
  output_path = "../repositories/messaging/lambda-a.zip"
}

data "archive_file" "lambda_b_zip" {
  type        = "zip"
  source_dir  = "../repositories/messaging/lambda-b"
  output_path = "../repositories/messaging/lambda-b.zip"
}


module "lambda_a" {
  source        = "../modules/lambda"
  lambda_name   = "lambda-a"
  handler       = "main.handler"
  runtime       = "python3.11"
  zip_path      = data.archive_file.lambda_a_zip.output_path
  queue_arn     = module.queue.arn
}


module "lambda_b" {
  source        = "../modules/lambda"
  lambda_name   = "lambda-b"
  handler       = "main.handler"
  runtime       = "python3.11"
  zip_path      = data.archive_file.lambda_b_zip.output_path
  queue_arn     = module.queue.arn
}