#!/bin/bash

# Function to ask the user for network interface name
get_interface() {
  read -p "Enter network interface name (e.g. enp0s3): " interface
}

# Function to ask the user for the desired IP address
get_ip() {
  read -p "Enter desired IP address (e.g. 192.168.1.100): " ip
}

# Function to ask the user for the gateway
get_gateway() {
  read -p "Enter gateway (e.g. 192.168.1.1): " gateway
}

# Function to ask the user for the DNS servers
get_dns() {
  read -p "Enter DNS servers (e.g. 1.1.1.1 1.0.0.1): " dns
}
#

# Install cloud-init if not already installed
install_cloud_init() {
  apt-get update
  apt-get install cloud-init
}

# Disable cloud-init
disable_cloud_init() {
  echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d/99-disable-cloud-init.cfg
}

# Create new netplan configuration
create_netplan_config() {
  # Create netplan configuration file
  echo "network:
  version: 2
  ethernets:
    $interface:
      dhcp4: no
      addresses: [$ip/24]
      gateway4: $gateway
      nameservers:
        addresses: [$dns]" > /etc/netplan/50-cloud-init.yaml
}

# Main function
main() {
  get_interface
  get_ip
  get_gateway
  get_dns
  install_cloud_init
  disable_cloud_init
  create_netplan_config
  sudo netplan apply
}

# Call main function
main
