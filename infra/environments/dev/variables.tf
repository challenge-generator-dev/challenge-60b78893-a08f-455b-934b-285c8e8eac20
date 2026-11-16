# Variables específicas del entorno de desarrollo
# SUPERFICIE DE PRACTICA: definir las variables necesarias para el entorno

variable "environment" {
  description = "Nombre del entorno de despliegue"
  type        = string
  default     = "dev"
}

# TODO(reto): Agregar las variables requeridas por los módulos de API Gateway y Lambda