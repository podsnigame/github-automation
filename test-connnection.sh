#!/bin/bash

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/podsnigame

if ssh -T git@github.com; then
  echo "Autentikasi ke GitHub berhasil!"
else
  echo "Autentikasi ke GitHub gagal."
fi
