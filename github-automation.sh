#!/bin/bash

# Meminta input nama akun Github
echo -n "Enter Github username: "
read username

# Mengganti nama akun pada file config git
git config --global user.name "$username"

# Meminta input email akun Github
echo -n "Enter Github email: "
read email

# Mengganti email akun pada file config git
git config --global user.email "$email"

# Menampilkan pesan sukses
echo "Akun Github berhasil diganti menjadi $username <$email>."
