#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

brew update
brew install -y git ansible

mkdir -p "$HOME/scm"

cd "$HOME/scm"

git checkout https://github.com/alexcreasy/macos-setup.git

cd macos-setup

ansible-lint

echo "done"

#git checkout
