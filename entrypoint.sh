#!/bin/bash

# Iniciar Apache
service apache2 start

# Iniciar Nagios
service nagios start

# Mantener el contenedor en ejecución
tail -f /usr/local/nagios/var/nagios.log

