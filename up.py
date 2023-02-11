import subprocess

def run_cmd(cmd):
    return subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True).communicate()[0].decode()

def git_push(commit_message):
    run_cmd("git add *")
    run_cmd(f'git commit -m "{commit_message}"')
    output = run_cmd("git push")
    if "Everything up-to-date" in output:
        print("Tidak ada perubahan")
    elif "Everything up-to-date" not in output:
        print("Berhasil")

if __name__ == "__main__":
    commit_message = input("Masukkan pesan commit: ")
    git_push(commit_message)
