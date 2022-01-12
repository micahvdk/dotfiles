# Link custom .zsh files to Oh My Zsh custom folder
dotfiles::link::custom_zsh() {
  if [[ ! -f custom/secret.zsh ]]; then
    touch custom/secret.zsh
  fi
  for f in custom/*.zsh; do
    echo "Linking custom .zsh files..."
    ln -sf $HOME/dotfiles/$f $HOME/.oh-my-zsh/$f
  done
}

# Link ssh config
dotfiles::link::ssh_config() {
  echo "Linking ssh config..."
  mkdir -p $HOME/.ssh
  ln -sf $HOME/dotfiles/ssh/config $HOME/.ssh/config
}

# Link $HOME dotfiles
dotfiles::link::files() {
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
