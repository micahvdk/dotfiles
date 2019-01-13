#!/usr/bin/env bash
# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo 'Updating oh-my-zsh'
  # upgrade_oh_my_zsh
  chmod +x $OMZDIR/tools/upgrade.sh
  $OMZDIR/tools/upgrade.sh
fi

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed! Updating..."
  brew update
fi
