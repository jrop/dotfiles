source ~/antigen.zsh
antigen use oh-my-zsh
antigen theme robbyrussell
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

bindkey -v
bindkey jj vi-cmd-mode

TRAPINT() {
	print -n "^C"
	return $(( 128 + $1 ))
}

fpath=(~/.zsh-completion-scripts $fpath)
autoload -U compinit
compinit

[ -z "$TMUX" ] && tmux
