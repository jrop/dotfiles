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
abbr -a gb "git branch"
abbr -a gco "git checkout"
abbr -a gl "git l"
abbr -a gm "git merge"
abbr -a gs "git s"

abbr -a kcs "kubectl-switch -n"
abbr -a kp "kube-prompt"
abbr -a mon "tmux set mouse on"
abbr -a moff "tmux set mouse off"
abbr -a tclear "clear; and tmux clear-history"
abbr -a tsn "node -r ts-node/register"
abbr -a ts-node "node -r ts-node/register"
abbr -a vi "nvim"

abbr -a ldl "tail -f /var/log/system.log"
abbr -a lct "sudo launchctl"
abbr -a lctu "sudo launchctl unload"
abbr -a lctl "sudo launchctl load"

abbr -a sct "sudo systemctl"
abbr -a sctdr "sudo systemctl daemon-reload"
abbr -a jct "sudo journalctl"

set -gx EDITOR nvim
set -gx JOBS 13

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

which starship > /dev/null
if [ $status -eq 0 ]
  eval (starship init fish)
end

which direnv > /dev/null
if [ $status -eq 0 ]
  direnv hook fish | source
end
