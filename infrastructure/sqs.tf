module "queue" {
  source      = "../modules/sqs"
  queue_name  = "demo-queue"
}