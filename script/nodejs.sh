#!/bin/bash

echo "Updating package index..."
sudo apt-get update

echo "Installing Node.js version 18.x..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Verifying the installation..."
NODE_VERSION=$(node -v)
if [ $? -eq 0 ]; then
  echo "Node.js version $NODE_VERSION has been successfully installed."
else
  echo "Failed to install Node.js."
fi
