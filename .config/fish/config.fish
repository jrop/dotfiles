if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if status is-interactive; and not set -q TMUX; and command -sq tmux
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
abbr -a y "yadm"

abbr -a ldl "tail -f /var/log/system.log"
abbr -a lct "sudo launchctl"
abbr -a lctu "sudo launchctl unload"
abbr -a lctl "sudo launchctl load"

abbr -a sct "sudo systemctl"
abbr -a sctdr "sudo systemctl daemon-reload"
abbr -a jct "sudo journalctl"

command -sq lsof; and abbr -a listening "lsof -P -iTCP -sTCP:LISTEN"

set -gx EDITOR nvim
command -sq rg; and set -gx FZF_DEFAULT_COMMAND "rg --files"
set -gx JOBS 13
set -gx SPACEFISH_PROMPT_ADD_NEWLINE false
set -gx SPACEFISH_PACKAGE_SHOW false
set -gx WASMTIME_HOME "$HOME/.wasmtime"

# PATH
for p in /snap/bin $HOME/go/bin $HOME/.local/bin $HOME/.cargo/bin $WASMTIME_HOME/bin
  if [ -d $p ]
    string match -r "$p" "$PATH" > /dev/null; or set -gx PATH $p $PATH
  end
end

if [ -d /home/linuxbrew/.linuxbrew/ ]
  set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
  set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
  set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
  set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths;
  set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
  set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
end

# LD_LIBRARY_PATH
if [ -d $HOME/.local/lib ]
  set -gx LD_LIBRARY_PATH $HOME/.local/lib $LD_LIBRARY_PATH
end

# VI-mode (hybrid):
set -g fish_key_bindings fish_hybrid_key_bindings

command -sq starship; and eval (starship init fish)
command -sq direnv; and direnv hook fish | source
