#!/bin/bash

# Check for curl or wget
if command -v curl >/dev/null 2>&1; then
  DOWNLOAD_COMMAND="curl -LO"
elif command -v wget >/dev/null 2>&1; then
  DOWNLOAD_COMMAND="wget"
else
  echo "Error: curl or wget not found. Please install one of these utilities."
  exit 1
fi

# Prompt the user to either provide a URL or update the Go application
echo "Enter the URL to download the Go archive or type 'update' to update the Go application:"
read URL

if [ "$URL" == "update" ]; then
  echo "Updating Go application..."
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
else
  # Download the Go archive
  $DOWNLOAD_COMMAND $URL

  # Remove any previous Go installation
  sudo rm -rf /usr/local/go

  # Extract the archive into /usr/local
  sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz

  # Add /usr/local/go/bin to the PATH environment variable
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
  source ~/.zshrc
fi

# Verify the installation
go version
