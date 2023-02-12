#!/bin/bash

# Install software-properties-common if needed
sudo apt-get install software-properties-common -y

# Function to install Neovim
install_neovim () {
  if [ "$1" == "stable" ]; then
    # Add the stable PPA repository
    sudo add-apt-repository ppa:neovim-ppa/stable
  elif [ "$1" == "unstable" ]; then
    # Add the unstable PPA repository
    sudo add-apt-repository ppa:neovim-ppa/unstable
  else
    # Invalid option selected
    echo "Invalid option selected! Choose either 'stable' or 'unstable'"
    exit 1
  fi

  # Update the package index
  sudo apt-get update

  # Install Neovim
  sudo apt-get install neovim -y

  # Print a success message
  echo "Neovim ($1 version) has been successfully installed!"
}

# Function to install Python development headers
install_python_dev_headers () {
  # Install Python development headers
  sudo apt-get install python-dev python-pip python3-dev python3-pip -y

  # Print a success message
  echo "Python development headers have been successfully installed!"
}

# Ask the user which version of Neovim they want to install
read -p "Do you want to install the stable or unstable version of Neovim? [stable/unstable]: " neovim_version

# Call the function to install Neovim
install_neovim $neovim_version

# Call the function to install Python development headers
install_python_dev_headers
