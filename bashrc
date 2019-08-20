# Do not start tmux if:
# 1) We are in an SSH connection (ansible provisioning Vagrant will never terminate because tmux will sit there and not give the connection back)
# 2) tmux is already running
[ \( -z "$SSH_CONNECTION" \) -a \( -z "$TMUX" \) ] && tmux

alias dclean="docker images -qf dangling=true | xargs -n 1 docker rmi"
alias mon="tmux set mouse on"
alias moff="tmux set mouse off"
alias d="docker"
alias dc="docker-compose"
alias kc="kubectl"
alias kp="kube-prompt"
alias vi="nvim"
alias vim="nvim"

export EDITOR=nvim
export HISTCONTROL=ignoreboth
export PATH="$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export LD_LIBRARY_PATH="~/.local/lib:$LD_LIBRARY_PATH"

function get_bashit() {
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  ~/.bash_it/install.sh --no-modify-config
}
function get_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | PROFILE=/dev/null bash
}
function get_neovim_appimg() {
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
}
function get_rustup() {
  curl https://sh.rustup.rs -sSf | sh -s -- -y
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Bash-it
export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME=minimal
[ -f $BASH_IT/bash_it.sh ] && source $BASH_IT/bash_it.sh
