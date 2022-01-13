system::set::default_shell() {
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
  if [[ "${SHELL}" == *"bash"* ]]; then
    source ~/.bashrc
  elif [[ "${SHELL}" == *"zsh"* ]]; then
    source ~/.zshrc
  fi
}
