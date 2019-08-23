#!/usr/bin/env bash

if [ "Darwin" = "$(uname -s)" ]; then
  if [ -z $(which git) ]; then
    xcode-select --install
  fi
  if [ -z "$(which brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  which curl || brew install curl
  which python || brew install python
fi

if [ -n "$(which apt-get)" ]; then
  sudo apt-get update
  which git || sudo apt-get install -y git
  which curl || sudo apt-get install -y curl
  which python || sudo apt-get install -y python
fi

git clone https://github.com/jrop/dotfiles
cd dotfiles
git submodule update --init --recursive
./install
