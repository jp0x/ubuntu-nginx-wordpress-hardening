#!/bin/bash

# Hardening de Ubuntu: Deshabilitar root login SSH y actualizar firewall
echo "Haciendo hardening en Ubuntu..."

# Deshabilitar root login SSH
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Instalar y configurar UFW (Firewall)
sudo apt-get install ufw -y
sudo ufw allow OpenSSH
sudo ufw enable
