# Variables de entrada para el módulo de API Gateway
# TODO(reto): Definir variables necesarias para parametrizar el módulo
# Considerar:
# - Nombre del entorno (dev/prod)
# - ARN de la Lambda a integrar
# - Configuración de CORS
# - Tags para recursos

variable "environment" {
  description = "Entorno de despliegue (dev/prod)"
  type        = string
}