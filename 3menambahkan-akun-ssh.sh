#!/bin/bash

echo "Masukkan nama akun Github baru Anda: "
read new_github_username

echo "Masukkan nama untuk kunci SSH baru Anda: "
read new_ssh_key_name

echo "Membuat kunci ssh baru..."
ssh-keygen -t rsa -b 4096 -C "$new_github_username" -f ~/.ssh/"$new_ssh_key_name"

echo "Menambahkan kunci ssh baru..."
ssh-add ~/.ssh/"$new_ssh_key_name"

echo "Menambahkan kunci ssh baru ke Github..."
cat ~/.ssh/"$new_ssh_key_name".pub | xclip -selection clipboard

echo "Silahkan paste kunci ssh baru Anda ke Github: https://github.com/settings/keys"
read -p "Tekan [Enter] setelah Anda selesai menambahkan kunci ssh baru..."

echo "Menambahkan informasi akun Github baru ke file konfigurasi ssh..."
echo "
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/$new_ssh_key_name
  IdentitiesOnly yes
" >> ~/.ssh/config

echo "Melakukan tes koneksi ke Github..."
ssh -T git@github.com

echo "Akun Github berhasil diubah."