#!/usr/bin/env bash

# Set DEFAULT_USER to suppress username in context
# This cleans up the prompt for times when you are the normal user
# user@hostname will be shown at other times (e.g. ssh sessions)
echo "DEFAULT_USER=$(whoami)" >> ~/.zshrc

# Change the users default shell
chsh -s /usr/local/bin/zsh