#!/bin/bash

# Function to start htop
function start_htop {
  echo "Starting htop..."
  htop
}

# Prompt user to start htop
read -p "Do you want to start htop to monitor your processor? [y/n]: " choice

# Start htop if user choice is y
if [ "$choice" == "y" ]; then
  start_htop
else
  echo "Exiting..."
fi

