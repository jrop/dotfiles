set number
set mouse=a

hi NonText ctermfg=DarkGray guifg=gray
hi SpecialKey ctermfg=DarkGray
set listchars=eol:$,trail:·,tab:»\ ,extends:>,precedes:<,nbsp:.
set list

set tabstop=2
set shiftwidth=2
imap jj <Esc>

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'mhartington/oceanic-next'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme OceanicNext
