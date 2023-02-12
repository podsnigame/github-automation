#!/bin/bash

# Memulai ssh-agent
eval "$(ssh-agent -s)"

# Menambahkan kunci SSH ke ssh-agent
ssh-add ~/.ssh/podsnigame

# Melakukan tes koneksi ke GitHub menggunakan ssh
ssh -T git@github.com

# Menampilkan pesan jika koneksi berhasil
echo "Koneksi ke GitHub berhasil!"
