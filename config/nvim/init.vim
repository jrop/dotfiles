tmap jj <C-\><C-n>
tmap <Esc> <C-\><C-n>
tmap <C-[> <C-\><C-n>

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.vimrc-common

