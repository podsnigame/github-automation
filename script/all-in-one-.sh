#!/bin/bash

# Function to display menu
display_menu() {
    echo "===================================================="
    echo "=                 All-in-One Automation            ="
    echo "===================================================="
    echo "= 1. Backup files                                  ="
    echo "= 2. Update system packages                        ="
    echo "= 3. Clean up system junk files                    ="
    echo "= 4. Monitor system performance                    ="
    echo "= 5. Exit                                         ="
    echo "===================================================="
    echo -n "Enter your choice [1-5]: "
}

# Function to backup files
backup_files() {
    read -p "Enter the source directory: " source
    read -p "Enter the destination directory: " dest
    echo "Backing up $source to $dest..."
    tar -czf $dest/backup-$(date +%Y-%m-%d).tar.gz $source
    echo "Backup complete."
}

# Function to update system packages
update_packages() {
    echo "Updating system packages..."
    sudo apt-get update && sudo apt-get upgrade -y
    echo "Update complete."
}

# Function to clean up system junk files
clean_up() {
    echo "Cleaning up system junk files..."
    sudo apt-get autoremove -y && sudo apt-get autoclean
    echo "Clean up complete."
}

# Function to monitor system performance
monitor_performance() {
    echo "Monitoring system performance..."
    top
}

# Main program
while true; do
    display_menu
    read choice
    case $choice in
        1) backup_files ;;
        2) update_packages ;;
        3) clean_up ;;
        4) monitor_performance ;;
        5) exit 0 ;;
        *) echo "Invalid option. Try again.";;
    esac
done
