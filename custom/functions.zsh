# Clean deleted upstream branches
git-clean() {
  fetch-and-prune
  # Delete local branches that are ":gone" from origin
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}

fetch-and-prune() {
  # fetch all branches
  git fetch --all >/dev/null
  # Prune remote branches
  git remote prune origin
}


# Clean deleted upstream branches
cleanup-local-branches() {
  # fetch all branches
  git fetch --all
  # Prune remote branches
  git remote prune origin
  # Delete local branches that are ":gone" from origin
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}
