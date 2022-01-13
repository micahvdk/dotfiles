## Expected libaries to be loaded.
# system.sh
# log.sh

brew::set::path(){
  log::function
  if [[ $(uname) == "Darwin" ]]; then
    PATH=/usr/local/bin:"${PATH}"
    echo "${PATH}" >> ~/.bashrc
    echo "${PATH}" >> ~/.zshrc
    echo "export ${PATH}"
  elif [[ $(uname) == "Linux" ]]; then
    PATH=/home/linuxbrew/.linuxbrew/bin:"${PATH}"
    echo "${PATH}" >> ~/.bashrc
    echo "${PATH}" >> ~/.zshrc
    echo "export ${PATH}"
  fi
}

# Install brew
brew::install() {
  log::function
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
  log::function
  echo "Installing packages and apps with Homebrew & Cask..."
  brew bundle --file=dependencies/Brewfile --no-lock --no-upgrade
  if [[ $(uname) == "Darwin" ]]; then
    brew bundle --file=dependencies/Brewfile.cask --no-lock --no-upgrade
  fi
}
