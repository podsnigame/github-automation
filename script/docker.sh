#!/bin/bash

echo "Removing any older versions of Docker..."
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "Updating package index..."
sudo apt-get update

echo "Installing required packages..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "Creating a keyring directory..."
sudo mkdir -m 0755 -p /etc/apt/keyrings

echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adding the Docker repository to the APT sources..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package index again..."
sudo apt-get update

echo "Making the Docker GPG key readable..."
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Updating package index one last time..."
sudo apt-get update

echo "Installing Docker CE and related packages..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Testing the Docker installation..."
sudo docker run hello-world

echo "Updating package index..."
sudo apt-get update

echo "Installing the Docker Compose plugin..."
sudo apt-get install docker-compose-plugin

echo "Verifying the Docker Compose installation..."
DOCKER_COMPOSE_VERSION=$(docker-compose version)
if [ $? -eq 0 ]; then
  echo "Docker Compose version $DOCKER_COMPOSE_VERSION has been successfully installed."
else
  echo "Failed to install Docker Compose."
fi
