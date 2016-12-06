" {{ Plugins "
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender'
call plug#end()
" }} "

" {{ Theme "
colorscheme tender
let g:tender_lightline = 1
let g:lightline = { 'colorscheme': 'tender' }
" }} "

set number
set mouse=a
set tabstop=2
set shiftwidth=2

" {{ Whitespace "
set listchars=eol:$,trail:·,tab:»\ ,extends:>,precedes:<,nbsp:.
hi NonText ctermfg=DarkGray guifg=gray
hi SpecialKey ctermfg=DarkGray
set list
" }} "

imap jj <Esc>
