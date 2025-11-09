# terraform-localstack-poc

This proof of concept validates the creation and execution of AWS resources in a completely local environment using **OpenTofu**, **AWS Provider**, **LocalStack**, and **Lambdas in Python 3.11**.

The goal is to simulate a minimal architecture composed of:

- Two **AWS Lambda** functions (`lambda-a` and `lambda-b`)
- An **Amazon SQS** queue
- Local IAM Roles
- Automatic packaging with `archive_file`
- Local execution of Lambdas with AWS CLI

The POC demonstrates that it is possible to test applications in an AWS-like infrastructure without costs and without interaction with real accounts.

---

## POC Architecture

- **OpenTofu**: IaC tool compatible with Terraform.

- **LocalStack**: environment that simulates AWS services locally.

- **AWS CLI**: invocation and inspection of services.

- **Python 3.11**: Lambda runtime.

- **Docker**: backend required for running Lambdas on LocalStack.

---

## POC Flow

1. Packaging of the `lambda-a` and `lambda-b` directories via `archive_file`.

2. Creation of the necessary IAM Roles and Policies.

3. Provisioning of the SQS queue.

4. Deployment of Lambda functions.

5. Invocation and testing of functions via the AWS CLI.

6. Querying the created resources via commands pointing to LocalStack.

---

## Useful Commands

### List Lambdas

```sh
aws lambda list-functions \
--endpoint-url http://localhost:4566 \
--region us-east-1
```


### Invoke lambda
```sh
aws lambda invoke \
  --function-name lambda-a \
  --endpoint-url http://localhost:4566 \
  --region us-east-1 \
  --log-type Tail \
  /dev/stdout
```