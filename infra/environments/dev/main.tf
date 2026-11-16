# Entorno de desarrollo - Configuración de recursos AWS
# SUPERFICIE DE PRACTICA: completar con la implementación del reto

terraform {
  # Backend configuration for state management
  backend "s3" {
    bucket = "orders-app-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Módulo de API Gateway
# TODO(reto): Implementar la configuración del API Gateway para el entorno de desarrollo
# El módulo debe recibir las variables necesarias para crear el API de pedidos
module "api_gateway" {
  source = "../../modules/api_gateway"

  environment = var.environment
  # TODO(reto): Agregar las variables adicionales requeridas por el módulo
}

# Módulo de Lambda
# TODO(reto): Implementar la configuración de Lambda para el entorno de desarrollo
module "lambda" {
  source = "../../modules/lambda"

  environment          = var.environment
  function_name        = "orders-api-dev"
  source_code_path     = "./lambda"
  lambda_role_name     = "orders-lambda-role-dev"
  runtime              = "nodejs20.x"
  handler              = "index.handler"
  timeout              = 30
  memory_size          = 256
  environment_variables = {
    ENVIRONMENT = var.environment
    API_URL     = "https://${module.api_gateway.api_gateway_url}.execute-api.us-east-1.amazonaws.com"
  }
}

# Integración de Lambda con API Gateway
# TODO(reto): Configurar la integración entre API Gateway y Lambda