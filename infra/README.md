# Terraform AWS Infrastructure

## Estructura del Proyecto

```
.
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── modules/
│   ├── api_gateway/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── lambda/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── versions.tf
├── providers.tf
└── README.md
```

## Requisitos Previos

- Terraform >= 1.9.0
- AWS CLI configurado con credenciales válidas
- AWS Provider >= 5.0

## Configuración Inicial

1. Configurar las credenciales AWS:
```bash
aws configure
```

2. Inicializar Terraform en el entorno deseado:
```bash
cd environments/dev
terraform init
```

## Comandos Útiles

- **Planificar cambios**:
```bash
terraform plan
```

- **Aplicar cambios**:
```bash
terraform apply
```

- **Destruir infraestructura**:
```bash
terraform destroy
```

## Variables de Entorno

Las variables específicas de cada entorno se definen en:
- `environments/dev/terraform.tfvars`
- `environments/prod/terraform.tfvars`

## Módulos

### API Gateway
Define una API REST en AWS API Gateway con integración Lambda.

### Lambda
Define funciones Lambda con sus permisos y configuraciones asociadas.

## Validación Local

Para validar la sintaxis y configuración:
```bash
terraform validate
```

Para verificar el formato de los archivos:
```bash
terraform fmt -check
```