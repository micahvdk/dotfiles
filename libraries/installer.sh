#Install kubetail
installer::get::dependencies() {
  log::function
  if [[ "$(uname)" == "Linux" ]];then
    sudo apt update
    sudo apt install -y libpcap-dev make build-essential zlib1g-dev
  else
    echo "Function only runs on Linux"
  fi
}

#Install kubetail
installer::get::kubetail() {
  log::function
  if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/kubetail ]]; then
  git clone https://github.com/johanhaleby/kubetail.git ~/.oh-my-zsh/custom/plugins/kubetail
  fi
}
