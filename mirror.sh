#!/usr/bin/env sh
set -eu

/setup-ssh.sh

# Git options
export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa_di_codecommit -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

# Make sure remote "mirror" does not exist
git remote rm mirror

# Add remote mirror
git remote add mirror "$INPUT_TARGET_REPO_URL"

# Push
git push --tags --force --prune mirror "refs/remotes/origin/*:refs/heads/*"
