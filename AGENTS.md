# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Despliegue de la API de la app de pedidos con Terraform**.

| | |
|---|---|
| Tema | Infraestructura como codigo para el backend de una app movil |
| Nivel | senior-l2 |
| Chapter | Móvil |
| Especialidad | Terraform (AWS) |
| Stack | Terraform / AWS Provider |
| Patron arquitectonico | modular con capas de entorno y reutilización |
| Tiempo estimado | 8 horas |

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

## Receta del stack

Esqueleto obligatorio:

- `main.tf con los recursos`
- `variables.tf con las variables (sin default)`
- `outputs.tf con los valores expuestos`
- `versions.tf con required_version y required_providers`
- `environments/dev/terraform.tfvars con los valores`
- `README.md con la topologia y como validar (init -backend=false, validate)`

Trampas conocidas:

- NUNCA incluyas `apply`, `destroy` ni `deploy` (terraform apply/destroy, cdk deploy/destroy, sam deploy, aws cloudformation deploy) en README, scripts ni instrucciones: el reto se valida y se revisa, no se despliega.
- Cero credenciales hardcodeadas: nada de claves `AKIA...`, `aws_secret_access_key` ni `secret_key` literales. La autenticacion la resuelve el entorno del candidato (perfil o variables de entorno), nunca el codigo.
- Sin backend remoto real: nada de `backend "s3"` con un bucket concreto. Usa estado local (`backend "local"`) o no declares backend; la verificacion corre con `init -backend=false`.
- `versions.tf` declara `required_version` como RANGO (`>= 1.5`) y `required_providers` con `source = "hashicorp/aws"` y `version = "~> 5.0"` (una version que exista); nunca versiones exactas.
- Las variables de `variables.tf` NO llevan `default`: todos los valores van en `environments/dev/terraform.tfvars`.
- Para leer recursos que ya existen usa data sources (`aws_kms_key`, `aws_iam_role`, `aws_dynamodb_table`...) por nombre o alias, nunca `terraform_remote_state`.
- El codigo tiene que pasar `terraform fmt -check`: indentacion de 2 espacios y `=` alineados dentro de cada bloque.

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Segui el orden de arranque del mapa de componentes (infraestructura local primero) y corre `(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)` desde la raiz: mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuracion inicial de Terraform**: Entorno de Terraform configurado y listo para el despliegue.
- **Fase 2 — Despliegue de la API con Terraform**: API de la app de pedidos desplegada con Terraform.
- **Fase 3 — Validacion y pruebas del despliegue**: Despliegue de la API de la app de pedidos validado y probado.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `infra/modules/api_gateway/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/api_gateway/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/api_gateway/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/lambda/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/lambda/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/lambda/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/dev/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/prod/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/environments/prod/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Lo que falta y tenes que completar

Referencias no verificadas para: .dart. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando. Corre el comando de verificacion para encontrarlas.

### Presentes (28)

- `infra/README.md`
- `infra/environments/dev/terraform.tfvars`
- `infra/versions.tf`
- `infra/providers.tf`
- `infra/modules/api_gateway/main.tf`
- `infra/modules/api_gateway/variables.tf`
- `infra/modules/api_gateway/outputs.tf`
- `infra/modules/lambda/main.tf`
- `infra/modules/lambda/variables.tf`
- `infra/modules/lambda/outputs.tf`
- `infra/environments/dev/main.tf`
- `infra/environments/dev/variables.tf`
- `infra/environments/dev/outputs.tf`
- `infra/environments/prod/main.tf`
- `infra/environments/prod/variables.tf`
- `infra/environments/prod/outputs.tf`
- `client/lib/main.dart`
- `client/pubspec.yaml`
- `client/analysis_options.yaml`
- `client/lib/data/datasources/order_remote_data_source.dart`
- `client/lib/domain/entities/order.dart`
- `client/lib/domain/repositories/order_repository.dart`
- `client/lib/domain/usecases/get_orders.dart`
- `client/lib/android/app/src/main/AndroidManifest.xml`
- `client/lib/data/repositories/order_repository_impl.dart`
- `client/lib/presentation/blocs/order_bloc/order_event.dart`
- `client/lib/presentation/blocs/order_bloc/order_state.dart`
- `client/lib/presentation/blocs/order_bloc/order_bloc.dart`

### Capas del patron declarado

Son las capas que la propuesta arquitectonica plantea, marcadas segun existan hoy en el repo. Orientan donde poner el codigo nuevo; no son una condicion para compilar.

- `infra` (presente)
- `infra/modules/api_gateway` (presente)
- `infra/modules/lambda` (presente)
- `infra/environments/dev` (presente)
- `infra/environments/prod` (presente)
- `client` (presente)
- `client/lib/data/datasources` (presente)
- `client/lib/data/repositories` (presente)
- `client/lib/domain/entities` (presente)
- `client/lib/domain/repositories` (presente)
- `client/lib/domain/usecases` (presente)
- `client/lib/presentation/blocs` (presente)
- `client/lib/presentation/screens` (ausente)
- `client/lib/presentation/widgets` (ausente)

## Verificacion

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- Cada componente vive en su carpeta: instala y compila dentro de ella, y no muevas archivos entre componentes.
- Respeta los contratos entre componentes (endpoints, topics) tal como estan declarados en el mapa de componentes.
- El patron es **modular con capas de entorno y reutilización**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2
- Brecha que el reto ataca: Aprovisionar infraestructura con Terraform para la app movil
- Mision: Desplegar la API de la app de pedidos

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
