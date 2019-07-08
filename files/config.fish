if status is-interactive
and not set -q TMUX
    exec tmux
end

abbr -a dclean "docker images -qf dangling=true | xargs -n 1 docker rmi"
abbr -a mon "tmux set mouse on"
abbr -a moff "tmux set mouse off"
abbr -a d "docker"
abbr -a dc "docker-compose"
abbr -a kc "kubectl"
abbr -a kp "kube-prompt"

set -Ux EDITOR nvim
set -Ux KUBE_EDITOR "code -w"
set -Ux PATH "$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
set -Ux LD_LIBRARY_PATH "~/.local/lib:$LD_LIBRARY_PATH"
