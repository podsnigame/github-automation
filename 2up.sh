#!/bin/bash

echo "Menambahkan semua file ke dalam daftar stage git..."
git add *

echo "Masukkan keterangan perubahan yang ingin disimpan:"
read commit_message

echo "Menyimpan perubahan ke repository local..."
if git commit -m "$commit_message"; then
  echo "Perubahan disimpan ke repository local."
else
  echo "Tidak ada perubahan baru untuk disimpan."
  exit 1
fi

echo "Mengupload perubahan ke repository remote..."
if git push; then
  echo "Perubahan berhasil di-upload ke repository remote."
else
  echo "Upload perubahan ke repository remote gagal."
  exit 1
fi
