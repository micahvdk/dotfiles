# Link custom .zsh files to Oh My Zsh custom folder
dotfiles::link::custom_zsh() {
  log::function
  if [[ ! -f custom/secret.zsh ]]; then
    touch custom/secret.zsh
  fi
  for file in custom/*.zsh; do
    echo "Linking custom .zsh files..."
    ln -sf $HOME/dotfiles/$file $HOME/.oh-my-zsh/$file
  done
}

# Link ssh config
dotfiles::link::ssh_config() {
  log::function
  log::info "Linking custom .zsh files..."
  mkdir -p $HOME/.ssh
  if [[ $(uname -s) == "Darwin" ]]; then
    ln -sf $SCRIPT_DIR/ssh/config.mac $HOME/.ssh/config
  else
    ln -sf $SCRIPT_DIR/ssh/config.linux $HOME/.ssh/config
  fi
  mkdir -p $HOME/.ssh/config.d
  touch $HOME/.ssh/config.d/empty.config
}

# Link $HOME dotfiles
dotfiles::link::files() {
  log::function
  echo "Linking files to home directory..."
  for f in *; do
    if [[ $f == "README.md" || $f == "install" ]]; then
      echo "Ignoring special file $f"
    elif [[ -d $f ]]; then
      echo "Ignoring directory $f"
    else
      ln -sf $HOME/dotfiles/$f $HOME/.$f
    fi
  done
}

dotfiles::complete() {
if [[ $(uname) == "Darwin" ]]; then
  log::info "Setup complete, quit terminal and open iTerm to continue..."
else
  log::info "Setup complete - Open a new terminal"
fi
}
