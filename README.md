# Despliegue de la API de la app de pedidos con Terraform

Aprovisiona con Terraform los recursos que consume la aplicacion movil. Usa modulos reutilizables de Terraform para API Gateway y Lambda. La app debe mostrar el listado de pedidos con pull-to-refresh.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuracion inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el despliegue de la API.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configurar el entorno de Terraform para el despliegue de la API de la app de pedidos.
- Utilizar modulos reutilizables de Terraform para API Gateway y Lambda.

**Entregable:** Entorno de Terraform configurado y listo para el despliegue.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform
- Modulos reutilizables

</details>

### Fase 2: Despliegue de la API con Terraform

**Objetivo:** Desplegar la API de la app de pedidos utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Desplegar la API de la app de pedidos utilizando Terraform.
- Asegurar que la app muestre el listado de pedidos con pull-to-refresh.

**Entregable:** API de la app de pedidos desplegada con Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform
- Despliegue de API

</details>

### Fase 3: Validacion y pruebas del despliegue

**Objetivo:** Validar y probar el despliegue de la API de la app de pedidos.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Validar y probar el despliegue de la API de la app de pedidos.
- Asegurar que la app funcione correctamente y muestre el listado de pedidos con pull-to-refresh.

**Entregable:** Despliegue de la API de la app de pedidos validado y probado.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform
- Pruebas de despliegue

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para el despliegue de la API?
- **paraQueSirve**: ¿Para qué sirve utilizar modulos reutilizables de Terraform para API Gateway y Lambda?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para desplegar la API de la app de pedidos?

## Criterios de Evaluacion

- Configuracion inicial de Terraform realizada correctamente.
- Despliegue de la API con Terraform realizado correctamente.
- Validacion y pruebas del despliegue realizadas correctamente.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/api_gateway init -backend=false && terraform -chdir=modules/lambda init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/api_gateway validate && terraform -chdir=modules/lambda validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
