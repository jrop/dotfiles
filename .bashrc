# Do not start tmux if:
# 1) We are in an SSH connection (ansible provisioning Vagrant will never terminate because tmux will sit there and not give the connection back)
# 2) tmux is already running
[ \( -z "$SSH_CONNECTION" \) -a \( -z "$TMUX" \) ] && (
  command -v tmux > /dev/null && (tmux attach || exec tmux new)
)

alias dclean="docker images -qf dangling=true | xargs -n 1 docker rmi"
alias mon="tmux set mouse on"
alias moff="tmux set mouse off"
alias d="docker"
alias dc="docker-compose"
alias k="kubectl"

export EDITOR=nvim
export HISTCONTROL=ignoreboth
export PATH="$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
command -v rg > /dev/null && export FZF_DEFAULT_COMMAND="rg --files"

function add_ssh_key_to_github() {
  if [ ! -f $HOME/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 2048 -N "" -f $HOME/.ssh/id_rsa
  fi
  echo -n 'GitHub password for jrop: '
  read -s pw
  key=$(cat $HOME/.ssh/id_rsa.pub)
  curl -u "jrop:$pw" --data '{"title":"'"(hostname)"'","key":"'"$key"'"}' https://api.github.com/user/keys
}
function add_ssh_key_to_gitlab() {
  if [ ! -f $HOME/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa -b 2048 -N "" -f $HOME/.ssh/id_rsa
  fi
  echo -n 'GitLab token: '
  read -s tkn
  key=$(cat $HOME/.ssh/id_rsa.pub)
  curl -X POST -H "PRIVATE-TOKEN: $tkn" -H 'Content-Type: application/json' \
    --data "{\"title\": \"$hn\", \"key\": \"$key\"}" "https://gitlab.com/api/v4/user/keys"
}
function install_bashit() {
  git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
  $HOME/.bash_it/install.sh --no-modify-config
}
function install_gitlab_cli() {
  curl -sSfL https://raw.githubusercontent.com/makkes/gitlab-cli/master/install.sh | sh -s -- -b "$HOME/.local/bin"
}
function install_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | PROFILE=/dev/null bash
}
function install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
}
function install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
function install_neovim_appimg() {
  nvim_path=$HOME/.local/bin/nvim
  curl -Lo $nvim_path https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
  chmod u+x $nvim_path
}
function install_neovim_nightly_appimg() {
  nvim_path=$HOME/.local/bin/nnvim
  curl -Lo $nvim_path https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x $nvim_path
}
function install_rustup() {
  curl https://sh.rustup.rs -sSf | sh -s -- -y
}
function install_starship() {
  curl -fsSL https://starship.rs/install.sh | bash -s -- -y -b "$HOME/.local/bin"
}

# Bash-it
if [ -f "$HOME/.bash_it/bash_it.sh" ]; then 
  export BASH_IT="$HOME/.bash_it"
  if command -v starship > /dev/null; then
    export BASH_IT_THEME=""
  else
    export BASH_IT_THEME=${BASH_IT_THEME:-minimal}
  fi
  [ -f $BASH_IT/bash_it.sh ] && source $BASH_IT/bash_it.sh
fi

# NVM
if [ -f "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# FZF
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

command -v starship > /dev/null && eval "$(starship init bash)"
