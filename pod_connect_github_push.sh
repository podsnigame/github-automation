#!/bin/bash

# Memulai ssh-agent
eval "$(ssh-agent -s)"

# Menambahkan kunci SSH ke ssh-agent
ssh-add ~/.ssh/podsnigame

# Melakukan tes koneksi ke GitHub menggunakan ssh
ssh -T git@github.com

# Menampilkan pesan jika koneksi berhasil
if [ $? -eq 0 ]; then
  echo "Koneksi ke GitHub berhasil!"
else
  echo "Koneksi ke GitHub gagal."
  exit 1
fi

# Meminta input untuk keterangan commit
echo -n "Masukkan keterangan commit: "
read commit_message

# Melakukan git add *
git add *

# Melakukan git commit dengan keterangan yang diberikan
git commit -m "$commit_message"

# Melakukan git push
git push

# Menampilkan pesan jika push berhasil
echo "Push ke GitHub berhasil!"
