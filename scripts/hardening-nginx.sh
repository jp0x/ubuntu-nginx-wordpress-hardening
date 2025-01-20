#!/bin/bash

# Hardening de Nginx: Deshabilitar información de versión y mejorar TLS
echo "Haciendo hardening en Nginx..."

# Deshabilitar server tokens
sudo sed -i 's/# server_tokens off;/server_tokens off;/' /etc/nginx/nginx.conf
sudo sed -i 's/# ssl_protocols TLSv1 TLSv1.1 TLSv1.2/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/nginx.conf
sudo sed -i 's/# ssl_prefer_server_ciphers on;/ssl_prefer_server_ciphers on;/' /etc/nginx/nginx.conf

# Reiniciar Nginx para aplicar cambios
sudo systemctl restart nginx
