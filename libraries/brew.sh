## Expected libaries to be loaded.
# system.sh
# log.sh

brew::export::path(){
  log::function
  if ! command -v brew; then
    if [[ $(uname -sm) == "Darwin arm64" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ $(uname -sm) == "Darwin x86_64" ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    elif [[ $(uname -sm) == "Linux x86_64" ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      brew install gcc
    fi
  fi
}

brew::set::path(){
  log::function
  if [[ $(uname) == "Darwin" ]]; then
    PATH=${HOME}/.asdf/shims:/usr/local/bin:"${PATH}"
    echo "PATH='"${PATH}"'" >> ~/.bashrc
    echo "PATH='"${PATH}"'" >> ~/.zshrc
  elif [[ $(uname) == "Linux" ]]; then
    PATH=${HOME}/.asdf/shims:/home/linuxbrew/.linuxbrew/bin:"${PATH}"
    echo "PATH='"${PATH}"'" >> ~/.bashrc
    echo "PATH='"${PATH}"'" >> ~/.zshrc
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
  brew bundle --file=~/dotfiles/Brewfile --no-lock --no-upgrade
}
