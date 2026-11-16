# Outputs del módulo de Lambda para referencia en otros módulos
# Superficie de práctica: el estudiante debe definir qué exponer

output "function_name" {
  description = "Nombre de la función Lambda creada"
  value = null # TODO(reto): aws_lambda_function.orders_lambda.function_name
  # TODO(reto): verificar que el recurso existe antes de referenciarlo
}

output "function_arn" {
  description = "ARN de la función Lambda"
  value = null # TODO(reto): aws_lambda_function.orders_lambda.arn
}

output "invoke_arn" {
  description = "ARN de invocación de la función Lambda"
  value = null # TODO(reto): aws_lambda_function.orders_lambda.invoke_arn
}

output "role_name" {
  description = "Nombre del rol de ejecución"
  value = null # TODO(reto): aws_iam_role.lambda_exec.name
}

output "role_arn" {
  description = "ARN del rol de ejecución"
  value = null # TODO(reto): aws_iam_role.lambda_exec.arn
}