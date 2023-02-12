#!/bin/bash

# Variabel yang menyimpan lokasi direktori home
home_dir=$HOME

# Menampilkan pesan pembuka
echo "Selamat datang di script membuat dotfiles"
echo "Script ini akan membantu Anda membuat dan mengelola dotfiles Anda"

# Meminta nama direktori yang akan dibuat untuk menyimpan dotfiles
read -p "Masukkan nama direktori yang akan dibuat untuk menyimpan dotfiles: " dotfiles_dir

# Menentukan lokasi direktori yang akan dibuat
dotfiles_dir="$home_dir/$dotfiles_dir"

# Membuat direktori yang ditentukan
mkdir $dotfiles_dir

# Menampilkan pesan jika direktori sudah dibuat
echo "Direktori $dotfiles_dir berhasil dibuat"

# Menampilkan pesan untuk meminta masukan file yang akan dibuat
echo "Masukkan nama file yang akan dibuat (tanpa tanda . di awal nama file):"

# Loop untuk membuat file
while true; do
  # Meminta masukan nama file
  read -p "Masukkan nama file atau ketik 'selesai' jika sudah selesai: " file_name

  # Keluar dari loop jika user mengetik 'selesai'
  if [ "$file_name" == "selesai" ]; then
    break
  fi

  # Membuat file dengan tanda . di depan nama file
  touch "$dotfiles_dir/.$file_name"

  # Menampilkan pesan jika file sudah dibuat
  echo "File .$file_name berhasil dibuat di direktori $dotfiles_dir"
done

# Menampilkan pesan penutup
echo "Anda telah selesai membuat dotfiles. Terima kasih telah menggunakan script ini."
