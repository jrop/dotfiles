scriptencoding utf-8
set encoding=utf-8
set guifont=Hack\ Nerd\ Font
set mouse=a
set nowrap
set number
set relativenumber
set splitbelow
set splitright

hi NonText ctermfg=DarkGray guifg=gray
hi SpecialKey ctermfg=DarkGray
set listchars=eol:$,trail:·,tab:»\ ,nbsp:.
set list

set tabstop=2
set shiftwidth=2

let mapleader=" "
let maplocalleader=" "
imap <C-[> <Esc>

nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>

map <C-t> :FZF<CR>
map <C-P> :Commands<CR>

map <Leader>bb :Buffers<CR>
map <Leader>bc :bnext<CR>
map <Leader>bn :bnext<CR>
map <Leader>bp :bprevious<CR>
map <Leader>ccmd :CocCommand<CR>
map <Leader>es :e $MYVIMRC<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>is :set expandtab<CR>
map <Leader>it :set noexpandtab<CR>
map <Leader>ir gg=G<CR>
map <Leader>n :nohlsearch<CR>
map <Leader>p :Prettier<CR>
map <Leader>rr :set relativenumber!<CR>
map <Leader>s :source $MYVIMRC<CR>
map <Leader>tf :NERDTreeFind<CR>
map <Leader>tr :NERDTreeRefreshRoot<CR>
map <Leader>tt :NERDTreeToggle<CR>
map <Leader>wa :MatchupWhereAmI??<CR>
map <Leader>wc :set cursorline!<CR>:set cursorcolumn!<CR>
map <Leader>ww :MatchupWhereAmI<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

autocmd FileType rust map <LocalLeader>p :RustFmt<CR>
autocmd BufNewFile,BufRead Dockerfile.* set filetype=Dockerfile

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

if has('nvim')
	tmap <Esc> <C-\><C-n>
	tmap <C-[> <C-\><C-n>
endif

let g:airline_powerline_fonts = 1
let g:calendar_google_calendar = 1
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-marketplace',
	\ 'coc-prettier',
	\ 'coc-rust-analyzer',
	\ 'coc-tsserver',
	\ 'coc-yaml'
	\ ]
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:NERDTreeWinPos = "right"

let g:sneak#label = 1

if has('nvim')
	let plug_dir = '~/.local/share/nvim/plugged'
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
else
	let plug_dir = '~/.vim/plugged'
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif
call plug#begin(plug_dir)
	Plug 'alampros/vim-styled-jsx'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'andymass/vim-matchup'
	Plug 'christianrondeau/vim-base64'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dag/vim-fish'
	Plug 'diepm/vim-rest-console'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'justinmk/vim-sneak'
	Plug 'itchyny/calendar.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'mhartington/oceanic-next'
	Plug 'matze/vim-move'
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': {-> coc#util#install()}}
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
	Plug 'ryanoasis/vim-devicons'
	Plug 'rust-lang/rust.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
call plug#end()

if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme OceanicNext

augroup filetypedetect
	au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
	au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END

"
" BEGIN Coc
"

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Coc: use prettier to format files:
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
