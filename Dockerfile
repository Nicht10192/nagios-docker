# Utilizar una imagen base oficial de Ubuntu
FROM ubuntu:20.04

# Establecer variables de entorno necesarias
ENV DEBIAN_FRONTEND noninteractive

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
    autoconf \
    gcc \
    libc6 \
    libmcrypt-dev \
    make \
    wget \
    unzip \
    apache2 \
    libapache2-mod-php \
    php \
    php-gd \
    libgd-dev \
    sendmail \
    curl \
    iputils-ping \
    build-essential \
    libssl-dev

# Crear usuario y grupo de Nagios
RUN useradd nagios && \
    groupadd nagcmd && \
    usermod -aG nagcmd nagios && \
    usermod -aG nagcmd www-data

# Descargar e instalar Nagios Core
RUN cd /tmp && \
    wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz && \
    tar xzf nagios-4.4.6.tar.gz && \
    cd nagios-4.4.6 && \
    ./configure --with-command-group=nagcmd && \
    make all && \
    make install && \
    make install-init && \
    make install-commandmode && \
    make install-config && \
    make install-webconf

# Descargar e instalar Nagios Plugins
RUN cd /tmp && \
    wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz && \
    tar xzf nagios-plugins-2.3.3.tar.gz && \
    cd nagios-plugins-2.3.3 && \
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios && \
    make && \
    make install

# Configurar el contacto por defecto para que use una dirección de correo válida
RUN sed -i 's/nagios@localhost/your-email@example.com/g' /usr/local/nagios/etc/objects/contacts.cfg

# Habilitar módulos de Apache
RUN a2enmod rewrite && \
    a2enmod cgi

# Configurar Apache para Nagios
RUN htpasswd -cb /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

# Exponer puertos necesarios
EXPOSE 80

# Copiar archivo de entrada y script de arranque
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Configurar el contenedor para ejecutar el script de arranque
ENTRYPOINT ["/entrypoint.sh"]


