[ -z "$TMUX" ] && EVENT_NOKQUEUE=1 tmux

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/scripts/init.zsh

SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt AUTO_CD

TRAPINT() {
	if [ "$IS_PROMPTING" == true ]; then
		print -n "^C"
		return $(( 128 + $1 ))
	fi
}
precmd() {
	IS_PROMPTING=true
	PROMPT=$(node ~/.zsh/prompt.js)
}
preexec() {
	IS_PROMPTING=false
}

bindkey -v
bindkey '^?' backward-delete-char
bindkey jj vi-cmd-mode

fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit
