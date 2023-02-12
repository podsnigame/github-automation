#!/bin/bash

# Define account credentials
first_email="bangundwir@yandex.com"
first_username="Bangundwirz"

second_email="podsnigame@gmail.com"
second_username="podsnigame"

# Print menu to select account
echo "Pilih akun yang akan digunakan:"
echo "1. $first_username ($first_email)"
echo "2. $second_username ($second_email)"
read -p "Masukkan pilihan (1/2): " choice

# Switch account based on user input
if [ "$choice" == "1" ]; then
  git config --global user.email "$first_email"
  git config --global user.name "$first_username"
  echo "Akun yang digunakan sekarang: $first_username ($first_email)"
elif [ "$choice" == "2" ]; then
  git config --global user.email "$second_email"
  git config --global user.name "$second_username"
  echo "Akun yang digunakan sekarang: $second_username ($second_email)"
else
  echo "Pilihan tidak valid. Akun tidak berubah."
fi
