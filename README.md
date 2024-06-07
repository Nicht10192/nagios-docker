# Instalación Nagios Core utilizando Docker

# Estos pasos estan pensados para ser utilizados en entorno Ubuntu.

## Instalar Docker

1. **Actualizar el índice de paquetes**:
    ```bash
    sudo apt-get update
    ```

2. **Instalar los paquetes necesarios**:
    ```bash
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    ```

3. **Añadir la clave GPG de Docker**:
    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

4. **Añadir el repositorio de Docker**:
    ```bash
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```

5. **Actualizar el índice de paquetes nuevamente**:
    ```bash
    sudo apt-get update
    ```

6. **Instalar Docker**:
    ```bash
    sudo apt-get install docker-ce
    ```

7. **Verificar que Docker esté instalado correctamente**:
    ```bash
    sudo systemctl status docker
    ```

## Instalar Docker Compose

1. **Descargar la última versión de Docker Compose**:
    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```
   Nota: Reemplaza `1.29.2` con la versión más reciente de Docker Compose disponible en la [página de releases de GitHub](https://github.com/docker/compose/releases).

2. **Aplicar permisos ejecutables al binario descargado**:
    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```

3. **Verificar que Docker Compose esté instalado correctamente**:
    ```bash
    docker-compose --version
    ```

## Clonar el Repositorio nagios-docker

Para clonar el repositorio [nagios-docker](https://github.com/Nicht10192/nagios-docker), sigue estos pasos:

1. **Instalar Git (si no lo tienes instalado)**:
    ```bash
    sudo apt-get install git
    ```

2. **Clonar el repositorio**:
    ```bash
    git clone https://github.com/Nicht10192/nagios-docker
    ```

3. **Navegar al directorio del repositorio clonado**:
    ```bash
    cd nagios-docker
    ```

## Construir y Levantar los Servicios con Docker Compose

1. **Construir y levantar los servicios con Docker Compose**:
    ```bash
    sudo docker-compose up -d
    ```

2. **Verificar que los contenedores estén corriendo**:
    ```bash
    sudo docker ps
    ```
   Este comando debería mostrarte los contenedores en ejecución, incluyendo el de Nagios.

## Acceder a Nagios desde el Navegador Web

Para acceder a Nagios desde el navegador web:

1. **Abre tu navegador web**.

2. **Ve a la dirección** `http://localhost:80/nagios/`.

3. **Credenciales de Usuario**:
   - **Usuario**: nagiosadmin
   - **Contraseña**: nagiosadmin
