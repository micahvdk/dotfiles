system::set::default_shell() {
  log::function
  if [[ $SHELL != "$(brew --prefix)/bin/zsh" ]]; then
      echo "Changing the default shell..."
      sudo chsh -s $(brew --prefix)/bin/zsh $USER
  fi
}


# Export asdf and brew to path
# This will just output "export $PATH" which needs to be run using eval
# Example: eval $(system::export::path)
system::export::path(){
  log::function
  if [[ $(uname) == "Darwin" ]]; then
    PATH="${HOME}/.asdf/shims:/usr/local/bin:${PATH}"
    echo "export PATH='"${PATH}"'"
  elif [[ $(uname) == "Linux" ]]; then
    PATH="${HOME}/.asdf/shims:/home/linuxbrew/.linuxbrew/bin:${PATH}"
    echo "export PATH='"${PATH}"'"
  fi
}

system::git::switch_to_ssh(){
  #/bin/bash
  #-- Script to automate https://help.github.com/articles/why-is-git-always-asking-for-my-password

  REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
  if [ -z "$REPO_URL" ]; then
    echo "-- ERROR:  Could not identify Repo url."
    echo "   It is possible this repo is already using SSH instead of HTTPS."
    return 1
  fi

  USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*)#\1#p'`
  if [ -z "$USER" ]; then
    echo "-- ERROR:  Could not identify User."
    return 1
  fi

  REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*)#\2#p'`
  if [ -z "$REPO" ]; then
    echo "-- ERROR:  Could not identify Repo."
    return 1
  fi

  NEW_URL="git@github.com:$USER/$REPO.git"
  echo "Changing repo url from "
  echo "  '$REPO_URL'"
  echo "      to "
  echo "  '$NEW_URL'"
  echo ""

  git remote set-url origin "$NEW_URL"

  echo "Success"
}
