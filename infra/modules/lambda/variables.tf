# Variables de entrada para el módulo de Lambda
# Superficie de práctica: el estudiante debe completar estas variables

variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
  # TODO(reto): agregar validación con regex para naming convention
}

variable "runtime" {
  description = "Runtime de Lambda (nodejs20x, python3.12, etc.)"
  type        = string
  default     = "nodejs20.x"
}

variable "handler" {
  description = "Handler de la función Lambda"
  type        = string
  default     = "index.handler"
}

variable "source_code_path" {
  description = "Ruta local al código fuente de la función"
  type        = string
  # TODO(reto): validar que la ruta existe o es un bucket S3
}

variable "timeout" {
  description = "Timeout en segundos"
  type        = number
  default     = 30
}

variable "memory_size" {
  description = "Memoria en MB"
  type        = number
  default     = 256
}

variable "environment_variables" {
  description = "Variables de entorno para la función"
  type        = map(string)
  default     = {}
}

variable "lambda_role_name" {
  description = "Nombre del rol IAM para ejecución de Lambda"
  type        = string
}

variable "environment" {
  description = "Entorno (dev, prod)"
  type        = string
  # TODO(reto): agregar validación: solo permitir dev o prod
}

variable "api_gateway_id" {
  description = "ID del API Gateway al que se integrará esta Lambda"
  type        = string
  default     = ""
}