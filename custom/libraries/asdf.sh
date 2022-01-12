# Install asdf version manager plugins and default versions
asdf::install::plugins() {
  cat ~/dotfiles/tool-versions | while read plugin version; do
    if [[ ! -d $HOME/.asdf/plugins/$plugin ]]; then
      echo "Installing asdf plugin $plugin..."
      asdf plugin add $plugin
      if [[ $plugin == "nodejs" ]]; then
        bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
      fi
    else
      echo "asdf plugin $plugin already installed, updating..."
      asdf plugin update $plugin
    fi
    $HOME/.asdf/bin/asdf install "${plugin}" "${version}"
  done
}

# Install asdf version manager
asdf::install(){
  if [[ ! -d $HOME/.asdf ]]; then
    echo "Installing asdf"
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    cd ~/dotfiles
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  else
    echo "asdf already installed"
  fi
}
