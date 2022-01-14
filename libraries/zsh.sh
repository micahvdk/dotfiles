########################
# Install additional zsh plugins not included with Oh My Zsh
# Globals:
# Arguments:
#  $@ - ZSH plugins to install
# Returns:
#   install progress
#########################
zsh::get::plugin() {
  for plugin in "$@"; do
    if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/"${plugin}" ]]; then
      echo "Installing ${plugin}..."
      git clone --depth=1 https://github.com/zsh-users/"${plugin}" $HOME/.oh-my-zsh/custom/plugins/"${plugin}"
    else
      echo "${plugin} already installed, updating..."
      cd $HOME/.oh-my-zsh/custom/plugins/"${plugin}"
      git pull
      cd $HOME/dotfiles
    fi
  done
}

########################
# Install Powerlevel10k zsh theme
# Globals:
# Arguments:
# Returns:
#   install progress
#########################
zsh::get::p10k() {
  if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    echo "Installing Powerlevel10k zsh theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
  else
    echo "Powerlevel10k already installed, updating..."
    cd $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    git pull
    cd $HOME/dotfiles
  fi
}

########################
# Install Oh My Zsh
# Globals:
# Arguments:
# Returns:
#   install progress
#########################
zsh::get::omz() {
  log::function
  if [[ ! -d $HOME/.oh-my-zsh ]]; then
    # Install Oh My Zsh
    echo "Installing Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
  else
    # Use the inbuilt mechanism to update Oh My Zsh
    echo "Oh My Zsh already installed, updating..."
    cd $HOME/.oh-my-zsh
    git pull
    cd $HOME/dotfiles
  fi
}
