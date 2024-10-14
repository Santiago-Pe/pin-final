#!/bin/bash
set -e

# Actualizar paquetes y asegurarse de que unzip esté disponible
echo "=== Updating packages and installing unzip ==="
sudo apt update && sudo apt install -y unzip

# ================== AWS CLI ==================
echo "=== Installing AWS CLI ==="

# Descargar el instalador oficial de AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extraer y ejecutar el instalador
unzip awscliv2.zip
sudo ./aws/install

# Verificar la instalación de AWS CLI
aws --version

# Limpieza de archivos temporales
rm -rf awscliv2.zip aws/

# ================== kubectl ==================
echo "=== Installing kubectl ==="

# Descargar kubectl desde Amazon EKS para la versión específica
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl

# Hacerlo ejecutable y moverlo a la carpeta binaria
chmod +x ./kubectl
mkdir -p $HOME/bin
mv ./kubectl $HOME/bin/kubectl

# Añadir kubectl a la variable PATH de manera persistente
export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

# Verificar la instalación de kubectl
kubectl version --client

# ================== eksctl ==================
echo "=== Installing eksctl ==="

# Descargar y extraer eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Mover el binario a /usr/local/bin
sudo mv /tmp/eksctl /usr/local/bin

# Añadir eksctl a la variable PATH de manera persistente
export PATH=$PATH:/usr/local/bin
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc

# Verificar la instalación de eksctl
eksctl version

# ================== Docker ==================
echo "=== Installing Docker ==="

# Actualizar e instalar Docker
sudo apt update
sudo apt install -y docker.io

# Añadir el usuario al grupo docker para ejecutar Docker sin sudo
sudo usermod -aG docker $USER

# Activar y arrancar el servicio Docker
sudo systemctl enable docker
sudo systemctl start docker

# Verificar la instalación de Docker
docker --version

# ================== Docker Compose ==================
echo "=== Installing Docker Compose ==="

# Obtener la última versión de Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

# Descargar e instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Hacer Docker Compose ejecutable
sudo chmod +x /usr/local/bin/docker-compose

# Verificar la instalación de Docker Compose
docker-compose --version

# ================== Helm ==================
echo "=== Installing Helm ==="

# Descargar e instalar Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Verificar la instalación de Helm
helm version

# ================== Terraform ==================
echo "=== Installing Terraform ==="

# Añadir la llave GPG para HashiCorp
sudo apt install -y software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Añadir el repositorio oficial de HashiCorp
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Actualizar paquetes e instalar Terraform
sudo apt update
sudo apt install -y terraform

# Verificar la instalación de Terraform
terraform --version
