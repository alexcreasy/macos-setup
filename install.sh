#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval $(/opt/homebrew/bin/brew shellenv)

brew update
brew install git ansible

mkdir -p "$HOME/scm"

cd "$HOME/scm"

git clone https://github.com/alexcreasy/macos-setup.git

cd macos-setup

ansible --version

echo "done"