# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/modules/api_gateway/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/lambda/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `infra` expone http (api: https://${api_gateway_url}.execute-api.${region}.amazonaws.com):
  - `GET /orders`
- `client` expone http (api: https://${api_gateway_url}.execute-api.${region}.amazonaws.com):
  - `GET /orders`

## Referencias no verificadas

Referencias no verificadas para: .dart. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando.

## Como saber que terminaste

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuracion inicial de Terraform — objetivo: Configurar el entorno de Terraform para el despliegue de la API. — entregable (NO resolver): Entorno de Terraform configurado y listo para el despliegue.
- Fase 2: Despliegue de la API con Terraform — objetivo: Desplegar la API de la app de pedidos utilizando Terraform. — entregable (NO resolver): API de la app de pedidos desplegada con Terraform.
- Fase 3: Validacion y pruebas del despliegue — objetivo: Validar y probar el despliegue de la API de la app de pedidos. — entregable (NO resolver): Despliegue de la API de la app de pedidos validado y probado.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: infra/providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: infra/modules/api_gateway/main.tf ===
# Módulo reutilizable para API Gateway con integración Lambda
# TODO(reto): Implementar la definición del API Gateway que exponga el endpoint GET /orders
# Debe integrarse con la Lambda que provee los datos de pedidos
# Considerar:
# - Configuración de rutas y métodos
# - Integración con Lambda
# - Configuración de CORS si es necesario
# - Outputs para referencia en otros módulos

# TODO(reto): implementa este bloque
# resource "aws_api_gateway_rest_api" "orders_api" {
# }

# TODO(reto): Definir recursos y métodos para el endpoint /orders

// === ARCHIVO: infra/modules/api_gateway/variables.tf ===
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

// === ARCHIVO: infra/modules/api_gateway/outputs.tf ===
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

// === ARCHIVO: infra/modules/lambda/main.tf ===
# Módulo reutilizable para Lambda con permisos y entorno
# TODO(reto): Implementar la definición de la Lambda que provee los datos de pedidos
# Considerar:
# - Configuración del runtime y handler
# - Variables de entorno necesarias
# - Políticas IAM con mínimo privilegio
# - Outputs para referencia en otros módulos

# TODO(reto): implementa este bloque
# resource "aws_lambda_function" "orders_lambda" {
#   # TODO(reto): Configurar variables de entorno necesarias
# }

# TODO(reto): Definir la política IAM con mínimo privilegio para la Lambda
# TODO(reto): implementa este bloque
# resource "aws_iam_role" "lambda_exec" {
# }

// === ARCHIVO: infra/modules/lambda/variables.tf ===
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

// === ARCHIVO: infra/modules/lambda/outputs.tf ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
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

// === ARCHIVO: infra/environments/dev/variables.tf ===
# Variables específicas del entorno de desarrollo
# SUPERFICIE DE PRACTICA: definir las variables necesarias para el entorno

variable "environment" {
  description = "Nombre del entorno de despliegue"
  type        = string
  default     = "dev"
}

# TODO(reto): Agregar las variables requeridas por los módulos de API Gateway y Lambda







// === ARCHIVO: infra/environments/dev/outputs.tf ===
# Outputs del entorno de desarrollo para validación
# SUPERFICIE DE PRACTICA: exponer los outputs necesarios

# URL base del API Gateway
# TODO(reto): Exponer la URL del API Gateway para que la app móvil la consuma

# Endpoint completo de la API de pedidos
# TODO(reto): Exponer el endpoint completo de pedidos

# ARN del API Gateway
# TODO(reto): Exponer el ARN del API Gateway

# ARN de la función Lambda
# TODO(reto): Exponer el ARN de la función Lambda

# Nombre del entorno

// === ARCHIVO: infra/environments/prod/main.tf ===
# TODO(reto): Implementar la configuración del entorno de producción
# Este archivo debe usar los módulos de api_gateway y lambda para desplegar la API
# La app móvil necesita el endpoint GET /orders que retorna la lista de pedidos

terraform {
  # Configuración específica para producción si es necesaria
}

# Referencia al módulo de API Gateway (se consumirá del módulo ya generado)

# Referencia al módulo de Lambda (se consumirá del módulo ya generado)

// === ARCHIVO: infra/environments/prod/variables.tf ===
# TODO(reto): Definir las variables específicas del entorno de producción
# Las variables deben permitir configurar el API Gateway y Lambda




// === ARCHIVO: infra/environments/prod/outputs.tf ===
# TODO(reto): Definir los outputs del entorno de producción
# Estos outputs permiten validar que el despliegue fue exitoso




// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'data/datasources/order_remote_data_source.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/repositories/order_repository.dart';
import 'domain/usecases/get_orders.dart';
import 'presentation/blocs/order_bloc/order_bloc.dart';
import 'presentation/blocs/order_bloc/order_event.dart';
import 'presentation/blocs/order_bloc/order_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    const baseUrl = 'https://placeholder.execute-api.us-east-1.amazonaws.com';
    final orderRemoteDataSource = OrderRemoteDataSourceImpl(
      dio: dio,
      baseUrl: baseUrl,
    );
    final OrderRepository orderRepository = OrderRepositoryImpl(
      remoteDataSource: orderRemoteDataSource,
      dio: dio,
      baseUrl: baseUrl,
    );
    final getOrders = GetOrders(repository: orderRepository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => OrderBloc(getOrders: getOrders),
        child: const OrderScreen(),
      ),
    );
  }
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderInitial) {
            context.read<OrderBloc>().add(const LoadOrders());
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<OrderBloc>().add(const RefreshOrders());
              },
              child: ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return ListTile(
                    title: Text('Order #${order.id}'),
                    subtitle: Text('Status: ${order.status}'),
                  );
                },
              ),
            );
          } else if (state is OrderError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<OrderBloc>().add(const ClearOrderError());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}

// === ARCHIVO: client/pubspec.yaml ===
name: reto
description: Reto de aprendizaje.
publish_to: none
version: 1.0.0+1

environment:
  sdk: ">=3.12.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: 5.11.1
  equatable: 2.1.0
  flutter_bloc: 9.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

// === ARCHIVO: client/analysis_options.yaml ===
analyzer:
  exclude:
    - _pendiente/**

// === ARCHIVO: client/lib/data/datasources/order_remote_data_source.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';

abstract class OrderRemoteDataSource {
  Future<OrderList> getOrders();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<OrderList> getOrders() async {
    try {
      final response = await dio.get('$baseUrl/orders');
      if (response.statusCode == 200) {
        final List<dynamic> ordersJson = response.data['orders'];
        final orders = ordersJson.map((json) => Order.fromJson(json)).toList();
        return OrderList(orders: orders);
      } else {
        throw Exception('Failed to load orders: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}

// === ARCHIVO: client/lib/domain/entities/order.dart ===
import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String productId;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [productId, quantity, price];

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final qty = json['quantity'] as int;
    final prc = (json['price'] as num).toDouble();
    if (qty <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }
    if (prc < 0) {
      throw ArgumentError('Price cannot be negative');
    }
    return OrderItem(
      productId: json['productId'] as String,
      quantity: qty,
      price: prc,
    );
  }
}

class Order extends Equatable {
  final String id;
  final String customerId;
  final List<OrderItem> items;
  final String status;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.status,
    required this.createdAt,
  });

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  List<Object?> get props => [id, customerId, items, status, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'items': items.map((item) => item.toJson()).toList(),
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    final orderItems = (json['items'] as List<dynamic>)
        .map((itemJson) => OrderItem.fromJson(itemJson as Map<String, dynamic>))
        .toList();
    if (orderItems.isEmpty) {
      throw ArgumentError('Order must have at least one item');
    }
    final orderStatus = json['status'] as String;
    if (orderStatus.isEmpty) {
      throw ArgumentError('Status cannot be empty');
    }
    return Order(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      items: orderItems,
      status: orderStatus,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

class OrderList extends Equatable {
  final List<Order> orders;

  const OrderList({required this.orders});

  @override
  List<Object?> get props => [orders];

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
    };
  }

  factory OrderList.fromJson(Map<String, dynamic> json) {
    return OrderList(
      orders: (json['orders'] as List<dynamic>)
          .map((orderJson) => Order.fromJson(orderJson as Map<String, dynamic>))
          .toList(),
    );
  }
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import '../entities/order.dart';

abstract class OrderRepository {
  Future<OrderList> getOrders();
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders({required this.repository});

  Future<OrderList> call() async {
    try {
      return await repository.getOrders();
    } catch (e) {
      throw Exception('Failed to fetch orders: ${e.toString()}');
    }
  }
}

// === ARCHIVO: client/lib/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        android:label="Reto"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final Dio dio;
  final String baseUrl;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.dio,
    required this.baseUrl,
  })  : assert(baseUrl.isNotEmpty, 'Base URL cannot be empty');

  @override
  Future<OrderList> getOrders() async {
    try {
      final orderList = await remoteDataSource.getOrders();
      return orderList;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Repository error: ${e.toString()}');
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return Exception('Unauthorized. Please login again.');
        } else if (statusCode == 403) {
          return Exception('Forbidden. You do not have permission.');
        } else if (statusCode == 404) {
          return Exception('Resource not found.');
        } else if (statusCode != null && statusCode >= 500) {
          return Exception('Server error. Please try again later.');
        }
        return Exception('Bad response: ${statusCode}');
      case DioExceptionType.cancel:
        return Exception('Request cancelled.');
      case DioExceptionType.connectionError:
        return Exception('No internet connection.');
      default:
        return Exception('Network error: ${e.message}');
    }
  }

  Future<Order?> getOrderById(String orderId) async {
    try {
      final orderList = await getOrders();
      return orderList.orders.firstWhere(
        (order) => order.id == orderId,
        orElse: () => throw Exception('Order not found'),
      );
    } catch (e) {
      if (e is Exception && e.toString().contains('Order not found')) {
        rethrow;
      }
      throw Exception('Failed to fetch order: ${e.toString()}');
    }
  }

  Future<List<Order>> getOrdersByCustomer(String customerId) async {
    try {
      final orderList = await getOrders();
      return orderList.orders
          .where((order) => order.customerId == customerId)
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch customer orders: ${e.toString()}');
    }
  }

  Future<List<Order>> getOrdersByStatus(String status) async {
    try {
      final orderList = await getOrders();
      return orderList.orders
          .where((order) => order.status.toLowerCase() == status.toLowerCase())
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch orders by status: ${e.toString()}');
    }
  }

  double calculateTotalRevenue(List<Order> orders) {
    return orders.fold(0.0, (sum, order) => sum + order.totalPrice);
  }

  Map<String, int> getOrderStatusDistribution(List<Order> orders) {
    final distribution = <String, int>{};
    for (final order in orders) {
      distribution[order.status] = (distribution[order.status] ?? 0) + 1;
    }
    return distribution;
  }
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_event.dart ===
abstract class OrderEvent {
  const OrderEvent();
}

class LoadOrders extends OrderEvent {
  const LoadOrders();
}

class RefreshOrders extends OrderEvent {
  const RefreshOrders();
}

class ClearOrderError extends OrderEvent {
  const ClearOrderError();
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_state.dart ===
import '../../../domain/entities/order.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final DateTime lastUpdated;

  const OrderLoaded({
    required this.orders,
    required this.lastUpdated,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderLoaded &&
        other.orders == orders &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode => orders.hashCode ^ lastUpdated.hashCode;

  double get totalRevenue {
    return orders.fold(0, (sum, order) => sum + order.totalPrice);
  }

  int get totalOrders => orders.length;

  List<Order> get pendingOrders {
    return orders.where((order) => order.status == 'pending').toList();
  }

  List<Order> get completedOrders {
    return orders.where((order) => order.status == 'completed').toList();
  }

  Map<String, int> get ordersByStatus {
    final Map<String, int> statusCount = {};
    for (final order in orders) {
      statusCount[order.status] = (statusCount[order.status] ?? 0) + 1;
    }
    return statusCount;
  }
}

class OrderError extends OrderState {
  final String message;
  final DateTime timestamp;

  const OrderError({
    required this.message,
    required this.timestamp,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderError &&
        other.message == message &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => message.hashCode ^ timestamp.hashCode;

  String get userFriendlyMessage {
    if (message.contains('SocketException') || message.contains('HandshakeException')) {
      return 'No se pudo conectar al servidor. Verifica tu conexión a internet.';
    } else if (message.contains('TimeoutException')) {
      return 'La solicitud tardó demasiado. Intenta de nuevo.';
    } else if (message.contains('403') || message.contains('Unauthorized')) {
      return 'No tienes autorización para acceder a los pedidos.';
    } else if (message.contains('404') || message.contains('Not Found')) {
      return 'No se encontraron pedidos.';
    } else if (message.contains('500') || message.contains('Internal Server Error')) {
      return 'Error del servidor. Intenta más tarde.';
    }
    return 'Ocurrió un error al cargar los pedidos. Intenta de nuevo.';
  }

  bool get isNetworkError {
    return message.contains('SocketException') ||
        message.contains('HandshakeException') ||
        message.contains('TimeoutException');
  }

  bool get isRetryable {
    return isNetworkError || message.contains('500');
  }
}

// === ARCHIVO: client/lib/presentation/blocs/order_bloc/order_bloc.dart ===
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_orders.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders getOrders;

  OrderBloc({required this.getOrders}) : super(const OrderInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<RefreshOrders>(_onRefreshOrders);
    on<ClearOrderError>(_onClearOrderError);
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<OrderState> emit) async {
    emit(const OrderLoading());
    try {
      final orderList = await getOrders();
      emit(OrderLoaded(
        orders: orderList.orders,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(OrderError(
        message: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _onRefreshOrders(RefreshOrders event, Emitter<OrderState> emit) async {
    try {
      final orderList = await getOrders();
      emit(OrderLoaded(
        orders: orderList.orders,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(OrderError(
        message: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  void _onClearOrderError(ClearOrderError event, Emitter<OrderState> emit) {
    emit(const OrderInitial());
  }
}
```
