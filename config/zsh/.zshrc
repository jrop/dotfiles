[ -z "$TMUX" ] && EVENT_NOKQUEUE=1 tmux

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/scripts/init.zsh

SAVEHIST=1000
HISTFILE=~/.zsh_history

node_prompt() {
	node ~/.zsh/prompt.js
}
setopt PROMPT_SUBST
PROMPT='$(node_prompt)'

bindkey -v
bindkey '^?' backward-delete-char
bindkey jj vi-cmd-mode

fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit
