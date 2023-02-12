#!/bin/bash

# Function to display a menu of available accounts
display_menu() {
  echo "Available Github accounts:"
  echo "1. Bangundwir (bangundwir@yandex.com)"
  echo "2. podsnigame (podsnigame@gmail.com)"
  read -p "Enter your choice: " choice
}

# Function to set up Git credentials for the selected account
set_git_credentials() {
  case $choice in
    1)
      git config --global user.email "bangundwir@yandex.com"
      git config --global user.name "Bangundwirz"
      ;;
    2)
      git config --global user.email "podsnigame@gmail.com"
      git config --global user.name "podsnigame"
      ;;
    *)
      echo "Invalid choice"
      exit 1
      ;;
  esac
}

# Function to get the personal access token for the selected account
get_pat() {
  read -sp "Enter personal access token for ${git config --global user.email}: " pat
  echo ""
  git config --global credential.helper "store --file=.git-credentials"
  echo "https://${pat}:@github.com" > .git-credentials
}

# Main function
main() {
  display_menu
  set_git_credentials
  get_pat
}

# Call main function
main
