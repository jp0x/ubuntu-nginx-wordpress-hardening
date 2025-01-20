#!/bin/bash

# Función para pedir las credenciales de AWS
ask_aws_credentials() {
    echo "Por favor ingresa tus credenciales de AWS"
    read -p "AWS Access Key ID: " AWS_ACCESS_KEY_ID
    read -p "AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
    read -p "AWS Region (e.g., us-east-1): " AWS_REGION
}

# Función para preguntar la clave SSH para la instancia EC2
ask_ssh_key() {
    read -p "Por favor ingresa el nombre de tu clave SSH para EC2 (sin extensión): " SSH_KEY_NAME
}

# Función para ejecutar los scripts en orden
run_scripts() {
    # Pedir credenciales de AWS
    ask_aws_credentials
    
    # Configurar AWS CLI
    echo "Configurando AWS CLI..."
    aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
    aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
    aws configure set region "$AWS_REGION"
    
    # Pedir el nombre de la clave SSH
    ask_ssh_key
    
    # Ejecutar cada script en orden
    echo "Ejecutando setup-bitnami.sh..."
    bash scripts/setup-bitnami.sh

    echo "Ejecutando hardening-ubuntu.sh..."
    bash scripts/hardening-ubuntu.sh

    echo "Ejecutando hardening-nginx.sh..."
    bash scripts/hardening-nginx.sh

    echo "Ejecutando backup-setup.sh..."
    bash scripts/backup-setup.sh

    echo "Ejecutando configure-aws-monitoring.sh..."
    bash scripts/configure-aws-monitoring.sh

    echo "Todos los scripts han sido ejecutados con éxito."
}

# Iniciar la ejecución
run_scripts
