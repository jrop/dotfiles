if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if status is-interactive; and not set -q TMUX; and which tmux
  exec tmux
end

abbr -a code "env TMUX=\"\" code"
abbr -a codei "env TMUX=\"\" code-insiders"
abbr -a d "docker"
abbr -a dc "docker-compose"
abbr -a dclean "docker images -qf dangling=true | xargs -n 1 docker rmi"
abbr -a g "git"
abbr -a kc "kubectl"
abbr -a kcs "kubectl-switch -n"
abbr -a kp "kube-prompt"
abbr -a mon "tmux set mouse on"
abbr -a moff "tmux set mouse off"
abbr -a tclear "tmux clear-history"
abbr -a tsn "node -r ts-node/register"
abbr -a ts-node "node -r ts-node/register"
abbr -a vi "nvim"

set -gx EDITOR nvim

# PATH
for p in /snap/bin $HOME/go/bin $HOME/.local/bin $HOME/.cargo/bin
  if [ -d $p ]
    set -gx PATH $p $PATH
  end
end

# LD_LIBRARY_PATH
if [ -d $HOME/.local/lib ]
  set -gx LD_LIBRARY_PATH $HOME/.local/lib $LD_LIBRARY_PATH
end

set -gx FZF_DEFAULT_COMMAND "rg --files"

set -gx SPACEFISH_PROMPT_ADD_NEWLINE false
set -gx SPACEFISH_PACKAGE_SHOW false

# VI-mode (hybrid):
set -g fish_key_bindings fish_hybrid_key_bindings
bind -M insert -m default jj force-repaint

which -s starship; and eval (starship init fish)
