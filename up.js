const { execSync } = require('child_process');

function runCommand(command) {
  try {
    const output = execSync(command).toString();
    return output;
  } catch (error) {
    console.error(error.stderr.toString());
  }
}

async function gitPush(commitMessage) {
  try {
    runCommand('git add *');
    runCommand(`git commit -m "${commitMessage}"`);
    const output = runCommand('git push');
    console.log(
      output.includes('Everything up-to-date')
        ? 'Tidak ada perubahan'
        : 'Berhasil'
    );
  } catch (error) {
    console.error(error);
  }
}

async function main() {
  const commitMessage = await new Promise((resolve) => {
    process.stdout.write('Masukkan pesan commit: ');
    process.stdin.resume();
    process.stdin.on('data', (data) => {
      resolve(data.toString().trim());
    });
  });
  await gitPush(commitMessage);
}

main();
