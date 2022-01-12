brew::set::path(){
  if [[ $(uname) == "Darwin" ]]; then
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
  elif [[ $(uname) == "Linux" ]]; then
    echo 'PATH="$PATH":/home/linuxbrew/.linuxbrew/bin' >> ~/.bashrc
    echo 'PATH="$PATH":/home/linuxbrew/.linuxbrew/bin' >> ~/.zshrc
  fi
}

# Install brew
brew::install() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
    brew::set::path
  else
    echo "Homebrew already installed, updating..."
    brew update
  fi
}

# Install apps & packages with Brewfile
brew::install::packages(){
  echo "Installing packages and apps with Homebrew & Cask..."
  brew bundle --file=dependencies/Brewfile --no-lock --no-upgrade
  if [[ $(uname) == "Darwin" ]]; then
    brew bundle --file=dependencies/Brewfile.cask --no-lock --no-upgrade
  fi
}
