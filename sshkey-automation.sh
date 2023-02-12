#!/bin/bash

# Membuat ssh key baru
echo "Membuat ssh key baru..."
ssh-keygen -t rsa -b 4096 -C "podsnigame@gmail.com"

# Menambahkan ssh key baru ke ssh-agent:

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/podsnigame

# Menyalin isi ssh key ke clipboard
echo "Menyalin isi ssh key ke clipboard..."
xclip -sel clip < ~/.ssh/podsnigame.pub

# Menampilkan pesan sukses
echo "ssh key berhasil dibuat dan disalin ke clipboard."
