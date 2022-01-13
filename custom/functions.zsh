# Clean local repo(s) of deleted upstream branches
function git-clean {
  if [[ $1 == "-r" ]]; then
    # Clean all repos
    # Assumes all your repos are in a single folder
    # Relies on cleanup-local-branches function
    echo "Cleaning all folders..."
    for dir in */; do
    echo "- Cleaning local branches in repo $dir..."
      cd $dir
      cleanup-local-branches
      cd ..
    done
  else
    cleanup-local-branches
  fi
}

# Clean deleted upstream branches
function cleanup-local-branches {
  # fetch all branches
  git fetch --all
  # Prune remote branches
  git remote prune origin
  # Delete local branches that are ":gone" from origin
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}

# Intercept well-intentioned brew commands that will break things
function brew() {
  case $@ in
    *elasticsearch|*mysql|*node|*nodenv|*nvm|*postgresql|*rbenv|*ruby|*rvm|*yarn)
      if [[ $1 == "install" || $1 == "upgrade" ]]; then
        echo "Here be dragons, you don't need to do this, ask someone for guidance..."
      else
        command brew $@
      fi
      ;;
    *)
      command brew $@
      ;;
  esac
}

# Imports SSH keys from OnePassword using title as file name
function op::import::ssh_keys() {
  local org_name
  org_name="$2"
  email="$1"
  if op get account | jq '.name' | grep "${org_name}"; then
    echo "OnePassword currently logged in"
  else
    echo "Need to login to OnePassword account"
    if eval $(op signin "${org_name}".1password.com "${email}" ); then
      op signin "${org_name}"
    fi
  fi
  for item in $(op list items --tags cli,ssh-key --vault private); do
    ssh_key_name=$(echo "${item}" | op get item - --fields title)
    echo -e $(echo "${item}" | op get item - --fields public_key) > ~/.ssh/"${ssh_key_name}.pub"
    echo -e $(echo "${item}" | op get item - --fields private_key) > ~/.ssh/"${ssh_key_name}"
  done
}
