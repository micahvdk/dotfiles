alias cl='clear'
alias e='$EDITOR'
alias ve='$VISUAL_EDITOR'

# This is required so you can use aliases with 'watch'
alias watch='watch '

# Nicely formatted diff for announcements
alias deploydiff="git log production..$(git_main_branch) --pretty=format:'%<(23)%an    %s' --abbrev-commit"

# Edit hosts file
alias hosts='sudo $EDITOR /etc/hosts'

# Use neovim instead of vim, it's just friendlier
alias vim='nvim'

# Docker
alias dkb="docker build"
alias dki="docker images"
alias dkp="docker push"
alias dkpl="docker pull"
alias dkps="docker ps"
alias dkr="docker run"
alias dkri="docker run -it --entrypoint=bash"

# kubectx shortcuts
alias kx="kubectx"
alias kns="kubens"
