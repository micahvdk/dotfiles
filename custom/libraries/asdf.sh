# Install asdf version manager plugins and default versions
asdf::install::plugins() {
  log::info "Running asdf::install::plugins"
  cat ~/dotfiles/tool-versions | while read plugin version; do
    if [[ ! -d $HOME/.asdf/plugins/$plugin ]]; then
      echo "Installing asdf plugin $plugin..."
      asdf plugin add $plugin
      if [[ $plugin == "nodejs" ]]; then
        if [[ -f ~/.asdf/plugins/"${plugin}"/bin/import-release-team-keyring ]]; then
          bash ~/.asdf/plugins/"${plugin}"/bin/import-release-team-keyring
        fi
      fi
    else
      echo "asdf plugin $plugin already installed, updating..."
      asdf plugin update $plugin
    fi
    asdf install "${plugin}" "${version}"
  done
}

# Install asdf version manager
asdf::install(){
  log::info "Running asdf::install"
  if [[ ! -d $HOME/.asdf ]]; then
    echo "Installing asdf"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd ~/dotfiles
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "asdf already installed"
  fi
}
