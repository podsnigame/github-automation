#!/bin/bash

echo "Masukkan nama akun Github baru Anda: "
read new_github_username

echo "Membuat kunci ssh baru..."
ssh-keygen -t rsa -b 4096 -C "$new_github_username" -f ~/.ssh/github_rsa_new

echo "Menambahkan kunci ssh baru..."
ssh-add ~/.ssh/github_rsa_new

echo "Menambahkan kunci ssh baru ke Github..."
cat ~/.ssh/github_rsa_new.pub | xclip -selection clipboard

echo "Silahkan paste kunci ssh baru Anda ke Github: https://github.com/settings/keys"
read -p "Tekan [Enter] setelah Anda selesai menambahkan kunci ssh baru..."

echo "Melakukan tes koneksi ke Github..."
ssh -T git@github.com

echo "Akun Github berhasil diubah."