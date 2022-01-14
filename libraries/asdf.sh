# Install asdf version manager plugins and default versions
asdf::install::plugins() {
  log::function
  while read plugin version source; do
    if [[ ! -d $HOME/.asdf/plugins/$plugin ]]; then
      echo "Installing asdf plugin $plugin..."
      asdf plugin add "${plugin}" "${source}"
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
  done < ~/dotfiles/tool-versions
}
