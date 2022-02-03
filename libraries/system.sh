system::set::default_shell() {
  log::function
  if [[ $SHELL != "$(brew --prefix)/bin/zsh" ]]; then
      echo "Changing the default shell..."
      sudo chsh -s $(brew --prefix)/bin/zsh $USER
  fi
}


# Export asdf and brew to path
# This will just output "export $PATH" which needs to be run using eval
# Example: eval $(system::export::path)
system::export::path(){
  log::function
  if [[ $(uname) == "Darwin" ]]; then
    PATH="${HOME}/.asdf/shims:/usr/local/bin:${PATH}"
    echo "export PATH='"${PATH}"'"
  elif [[ $(uname) == "Linux" ]]; then
    PATH="${HOME}/.asdf/shims:/home/linuxbrew/.linuxbrew/bin:${PATH}"
    echo "export PATH='"${PATH}"'"
  fi
}

system::git::switch_to_ssh(){
  cd $(dirname "$0")
  ls 
  git config --global url."git@github.com:".insteadOf "https://github.com/"
}
