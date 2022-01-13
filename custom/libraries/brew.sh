## Expected libaries to be loaded.
# system.sh
# log.sh

brew::set::path(){
  log::function
  if [[ $(uname) == "Darwin" ]]; then
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
  elif [[ $(uname) == "Linux" ]]; then
    echo 'PATH="$PATH":/home/linuxbrew/.linuxbrew/bin' >> ~/.bashrc
    echo 'PATH="$PATH":/home/linuxbrew/.linuxbrew/bin' >> ~/.zshrc
  fi
  system::source::shell
}

# Install brew
brew::install() {
  log::info "Running ${FUNCNAME[0]}"
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
  log::info "Running ${FUNCNAME[0]}"
  echo "Installing packages and apps with Homebrew & Cask..."
  brew bundle --file=dependencies/Brewfile --no-lock --no-upgrade
  if [[ $(uname) == "Darwin" ]]; then
    brew bundle --file=dependencies/Brewfile.cask --no-lock --no-upgrade
  fi
}
