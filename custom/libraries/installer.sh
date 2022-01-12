#Install kubetail
installer::get::kubetail() {
  if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/kubetail ]]; then
  git clone https://github.com/johanhaleby/kubetail.git ~/.oh-my-zsh/custom/plugins/kubetail
  fi
}
#Install KOPS
installer::get::kops() {
  if [[ -f /usr/local/bin/kops ]]; then
    echo "Kops already installed"
  else
    echo "Installing KOPS"
    curl -LO https://github.com/kubernetes/kops/releases/download/1.7.0/kops-linux-amd64
    chmod +x kops-linux-amd64
    sudo mv ./kops-linux-amd64 /usr/local/bin/kops
  fi
}

installer::get::kubectx() {
  if [[ ! -d /opt/kubectx ]]; then
  sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
  fi
  sudo ln -sf /opt/kubectx/kubectx /usr/local/bin/kubectx
  sudo ln -sf /opt/kubectx/kubens /usr/local/bin/kubens
}

installer::get::kubeval() {
  if [[ ! -f /usr/local/bin/kubeval ]]; then
    echo "Installing kubeval"
    wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
    mkdir -p ./kubeval
    tar xf kubeval-linux-amd64.tar.gz -C ./kubeval
    sudo mv ./kubeval/kubeval /usr/local/bin
    rm -f kubeval-linux-amd64.tar.gz
    rm -rf ./kubeval
  else
    echo "kubeval binary already exists"
  fi
}

installer::get::eksctl() {
  if [[ ! -f /usr/local/bin/eksctl ]]; then
    echo "Installing eksctl"
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
  else
    echo "eksctl already installed"
  fi
}