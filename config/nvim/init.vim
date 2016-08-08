call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender'
Plug 'Valloric/YouCompleteMe'
call plug#end()

colorscheme tender
let g:tender_lightline = 1
let g:lightline = {
	\ 'colorscheme': 'tender',
	\ 'component': {
	\   'readonly': '%{&readonly?"":""}',
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }

set tabstop=2
set shiftwidth=2

