if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if status is-interactive
and not set -q TMUX
  exec tmux
end

abbr -a code "env TMUX=\"\" code"
abbr -a d "docker"
abbr -a dc "docker-compose"
abbr -a dclean "docker images -qf dangling=true | xargs -n 1 docker rmi"
abbr -a kc "kubectl"
abbr -a kcs "kubectl-switch -n"
abbr -a kp "kube-prompt"
abbr -a mon "tmux set mouse on"
abbr -a moff "tmux set mouse off"

set -Ux EDITOR nvim
set -Ux KUBE_EDITOR "code -w"
set -Ux PATH "$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
set -Ux LD_LIBRARY_PATH "~/.local/lib:$LD_LIBRARY_PATH"
set -Ux SPACEFISH_PROMPT_ADD_NEWLINE false
