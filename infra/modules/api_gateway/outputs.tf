# Outputs del módulo de API Gateway
# TODO(reto): Definir outputs necesarios para referencia en otros módulos
# Considerar:
# - URL base de la API
# - ARN del API Gateway
# - ID del deployment

output "api_gateway_url" {
  description = "URL base del API Gateway"
  value = null # TODO(reto): "https://${aws_api_gateway_rest_api.orders_api.id}.execute-api.${data.aws_region.current.name}.amazonaws.com"
}

data "aws_region" "current" {}