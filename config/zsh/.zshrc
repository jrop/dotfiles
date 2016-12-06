[ -z "$TMUX" ] && EVENT_NOKQUEUE=1 tmux

TRAPINT() {
	print -n "^C"
	return $(( 128 + $1 ))
}

source ~/antigen.zsh
antigen use oh-my-zsh
antigen theme robbyrussell

antigen bundle docker
antigen bundle git
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

bindkey -v
bindkey '^?' backward-delete-char
bindkey jj vi-cmd-mode
