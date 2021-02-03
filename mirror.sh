#!/usr/bin/env sh
set -eu

/setup-ssh.sh


echo "run pwd and ls **************"
echo "pwd: $(pwd)"
echo "ls -al\n: $(ls -al)"

cd $INPUT_WORKDIR

echo "run pwd and ls **************"
echo "pwd: $(pwd)"
echo "ls -al\n: $(ls -al)"


# Git options
export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"

# Make sure remote "mirror" does not exist. Ignore error if not exists
git remote rm mirror || true

# Add remote mirror
git remote add mirror "$INPUT_TARGET_REPO_URL"

# Push
git push --tags --force --prune mirror "refs/remotes/origin/*:refs/heads/*"
