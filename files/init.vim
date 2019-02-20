set number
set mouse=a

hi NonText ctermfg=DarkGray guifg=gray
hi SpecialKey ctermfg=DarkGray
set listchars=eol:$,trail:·,tab:»\ ,extends:>,precedes:<,nbsp:.
set list

set tabstop=2
set shiftwidth=2
imap jj <Esc>
imap <C-[> <Esc>

tmap jj <C-\><C-n>
tmap <Esc> <C-\><C-n>
tmap <C-[> <C-\><C-n>

nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'mhartington/oceanic-next'
	Plug 'leafgarland/typescript-vim'
	Plug 'Quramy/tsuquyomi'
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
	Plug 'diepm/vim-rest-console'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme OceanicNext
