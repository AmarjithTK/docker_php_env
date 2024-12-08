#!/bin/bash

set -e  # Exit on error

echo "Updating package list..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Adding Docker's official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker Engine and CLI..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Verifying Docker and Docker Compose installation..."
docker --version
docker-compose --version

echo "Installation complete!"
echo "Restart your terminal or run 'newgrp docker' to use Docker without 'sudo'."

echo "Go to windows terminal and wsl --shutdown and then restart vscode for permission to apply"
