// Terraform tfvars for dev environment
// Values for variables without defaults in the dev stack

aws_region = "us-east-1"
environment = "dev"

api_gateway_name = "dev-api-gateway"
api_gateway_description = "API Gateway for dev environment"
api_gateway_stage_name = "dev"

lambda_function_name = "dev-lambda-function"
lambda_handler = "index.handler"
lambda_runtime = "nodejs20.x"
lambda_memory_size = 128
lambda_timeout = 3
lambda_environment_variables = {
  ENVIRONMENT = "dev"
}

lambda_source_path = "../../src/lambda"