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

system::source::shell() {
  log::function
  if [[ "${SHELL}" == *"bash"* ]]; then
    . ~/.bashrc
  elif [[ "${SHELL}" == *"zsh"* ]]; then
    . ~/.zshrc
  fi
}
