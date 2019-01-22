#!/usr/bin/env bash

# Install Oh My Zsh if it is not installed
# Otherwise, upgrade to the latest version
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo 'Updating oh-my-zsh'
  upgrade_oh_my_zsh
fi

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
else
  echo "Homebrew already installed! Updating..."
  brew update
fi

# Create secrets files if they don't exist yet
if [[ ! -f secrets/.personal_secrets ]]; then
  touch secrets/.personal_secrets
fi
if [[ ! -f secrets/.work_secrets ]]; then
  touch secrets/.work_secrets
fi
