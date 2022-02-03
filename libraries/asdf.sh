# Install asdf version manager plugins and default versions
asdf::install::plugins() {
  log::function
  while read plugin version source; do
    if [[ ! -d $HOME/.asdf/plugins/$plugin ]]; then
      echo "Installing asdf plugin $plugin..."
      asdf plugin add "${plugin}" "${source}"
    else
      echo "asdf plugin $plugin already installed, updating..."
      asdf plugin update $plugin
    fi
    asdf install "${plugin}" "${version}"
  done < ~/dotfiles/tool-versions
}

asdf::export::path() {
  log::function
  if echo "${PATH}" | grep -vq ".asdf/shims"; then # if grep doesn't find .asdf/shims then 
    eval $(echo "export PATH='${HOME}'/.asdf/shims:'${PATH}'")
  fi
}
