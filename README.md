# Nagios Core Docker Setup

Este repositorio contiene los archivos necesarios para configurar y ejecutar Nagios Core dentro de un contenedor Docker.

## Prerrequisitos

- Docker: [Instalar Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Estructura del Proyecto

- `Dockerfile`: Archivo de configuración para construir la imagen de Docker de Nagios Core.
- `docker-compose.yml`: Archivo de configuración de Docker Compose para definir y ejecutar los servicios.
- `entrypoint.sh`: Script de entrada para iniciar los servicios necesarios dentro del contenedor.
- `README.md`: Este archivo, que proporciona instrucciones sobre cómo usar el proyecto.

## Instrucciones

### 1. Construir la imagen de Docker

Para construir la imagen de Docker para Nagios Core, ejecuta el siguiente comando en el directorio donde se encuentra el `Dockerfile`:

```sh
docker-compose build

