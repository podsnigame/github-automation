import subprocess

# Menjalankan perintah eval "$(ssh-agent -s)"
subprocess.run(["eval", "$(ssh-agent -s)"])

# Menjalankan perintah ssh-add ~/.ssh/podsnigame
subprocess.run(["ssh-add", "~/.ssh/podsnigame"])

# Menjalankan perintah ssh -T git@github.com
result = subprocess.run(["ssh", "-T", "git@github.com"])

# Menampilkan pesan jika koneksi berhasil
if result.returncode == 0:
    print("Koneksi ke GitHub berhasil!")
else:
    print("Koneksi ke GitHub gagal.")
