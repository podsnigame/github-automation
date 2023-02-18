#!/bin/bash

# Melakukan git add *
git add *

# Membuat commit message secara otomatis dengan AI
commit_message=$(curl -X POST -H "Authorization: Bearer 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" -H "Content-Type: application/json" -d '{"prompt": "Please enter the commit message for the code changes:"}' "https://api.openai.com/v1/engines/davinci-codex/completions" | jq -r '.choices[].text')

# Melakukan git commit dengan message yang telah dibuat secara otomatis
git commit -m "$commit_message"

# Melakukan git push ke branch master
git push 
