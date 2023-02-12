#!/bin/bash

# Function to download using curl
function download_with_curl {
  echo "Downloading $1 using curl..."
  curl -O $1
}

# Function to download using wget
function download_with_wget {
  echo "Downloading $1 using wget..."
  wget $1
}

# Prompt user to select download tool
echo "Select download tool:"
echo "1. curl"
echo "2. wget"
read -p "Enter your choice [1/2]: " choice

# Prompt user to enter URL
read -p "Enter URL to download: " URL

# Call appropriate download function based on user choice
if [ $choice -eq 1 ]; then
  download_with_curl $URL
elif [ $choice -eq 2 ]; then
  download_with_wget $URL
else
  echo "Invalid choice. Exiting..."
fi
