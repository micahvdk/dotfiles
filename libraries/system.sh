system::set::default_shell() {
  log::function
  if [[ $(uname) == "Linux" ]]; then
  # Change the users default shell
  echo "Changing the default shell..."
  sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh $USER
  else
  echo "Changing the default shell..."
  sudo chsh -s /usr/local/bin/zsh $USER
  fi
}

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
