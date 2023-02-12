#!/bin/bash

# Menentukan versi tmux yang ingin diinstall
echo "Apakah Anda ingin menginstal versi stabil atau tidak stabil dari tmux?"
echo "1. Stabil"
echo "2. Tidak stabil"
read -p "Pilihan Anda: " version

# Melakukan instalasi tmux sesuai dengan pilihan versi
if [ $version == "1" ]; then
  echo "Menginstall versi stabil dari tmux..."
  sudo apt-get update
  sudo apt-get install tmux -y
elif [ $version == "2" ]; then
  echo "Menginstall versi tidak stabil dari tmux..."
  sudo add-apt-repository ppa:pi-rho/dev
  sudo apt-get update
  sudo apt-get install tmux -y
else
  echo "Pilihan tidak valid. Instalasi dibatalkan."
  exit 1
fi

# Mendownload dan menginstal TPM (Tmux Plugin Manager)
echo "Mendownload dan menginstal TPM (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Menyimpan konfigurasi tmux
echo "Menyimpan konfigurasi tmux..."
wget https://raw.githubusercontent.com/bangundwir/dotfiles/main/tmux.conf -O ~/.tmux.conf

echo "Instalasi tmux berhasil!"
