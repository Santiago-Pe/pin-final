#!/bin/bash

check_command() {
    if command -v $1 &> /dev/null
    then
        if [ "$1" = "helm" ]; then
            version=$($1 version 2>&1 | head -n 1)
        else
            version=$($1 --version 2>&1 | head -n 1)
        fi
        echo "$1 está instalado. Versión: $version"
    else
        echo "$1 no está instalado."
    fi
}

echo "Verificando dependencias DevOps:"
echo "================================"

# Verificar AWS CLI
check_command aws

# Verificar kubectl
check_command kubectl

# Verificar eksctl
check_command eksctl

# Verificar Docker
check_command docker

# Verificar Docker Compose
check_command docker-compose

# Verificar Helm
check_command helm

# Verificar Terraform
check_command terraform

# Verificar unzip (utilizado en la instalación)
check_command unzip

echo "================================"
echo "Verificación completada."