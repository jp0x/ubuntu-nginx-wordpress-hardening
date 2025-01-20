#!/bin/bash

# Instalación y configuración inicial de Bitnami WordPress AMI
echo "Configurando Bitnami WordPress en EC2..."

# Actualización del sistema
sudo apt-get update -y && sudo apt-get upgrade -y

# Instalación de Nginx y dependencias
sudo apt-get install -y nginx curl gnupg2 apache2-utils

# Habilitar y arrancar Nginx
sudo systemctl enable nginx
sudo systemctl start nginx
