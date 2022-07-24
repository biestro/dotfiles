" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
"focuspoint: also strong green but darker"
"gotham: dark and blue and red"
"hybrid: nice blue and others, jellybeans = this but +contrast"
"molokayo: strong pink-red and green and blue, BOLD"
"orbital: deep blue stuff"
"sierra: dark soft reds"
set background=dark

set visualbell

set noswapfile

set ttyfast lazyredraw

set showmatch

"system clipboard
set clipboard=unnamedplus


"other cool ones: 256noir, twilight256, torte, sunbather, oceanic material"
set number
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS 
call plug#begin('~/.vim/plugged')
  " Vim-latex
  Plug 'lervag/vimtex'
  " Bottom status Line
  Plug 'itchyny/lightline.vim'
  " Error lines
  Plug 'dense-analysis/ale'
	" Colorschemes
	Plug 'rafi/awesome-vim-colorschemes'
	" Nerdtree
	Plug 'preservim/nerdtree'
  " 
  Plug 'tpope/vim-commentary'
  " use cs"' to change " --> '
  Plug 'tpope/vim-surround'
  " colorschemes 2
  Plug 'fenetikm/falcon'
  " predivcive text
  " Plug 'primitivorm/vim-predictive'
  " rust autocomplete
  " python autocomplete
  " Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  " more autocomplete
  Plug 'maralla/completor.vim'
call plug#end()

" NERDTREE
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeDirArrowExpandable = '~'
let g:NERDTreeDirArrowCollapsible = '~'

" let g:predictive#disable_plugin = 1
" AUTOCOMPLETION
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" STATUS LINE CONFIG
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ }
  "\ 'colorscheme': 'apprentice',
  "\ 'colorscheme': 'jellybeans',
  
colorscheme falcon




" colorscheme gruvbox
"other maybe: alduin = soft greyish blue and green , similar: angr but this is strong green, and lucius, but grey is bluer, ayu"

set colorcolumn=70

set sw=2
set ts=2
set expandtab

" disables python tabbing
let g:python_recommended_style = 0

"search ignores upper or lowercase:"
set ignorecase

"copy-paste across terminals
set clipboard=unnamedplus

"comments
noremap <C-m> :normal! I#<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
"saves and runs python with F5, nmap for normal, imap for insert"
nmap <F5> <Esc>:w<CR>:!clear;python %<CR>
"running in julia
nmap <F6> <Esc>:w<CR>:!clear;julia %<CR>
"running with cargo run
nmap <F7> <Esc>:w<CR>:!clear;cargo run %<CR>
"running with octave
nmap <F8> <Esc>:w<CR>:!clear;octave %<CR>



" VIMTEX WARNINGS
let g:vimtex_quickfix_ignore_filters = [
    \'Underfull',
    \'underbar',
    \'underline',
    \'Overfull',
    \'specifier changed to',
    \'You have requested',
    \'Missing number, treated as zero.',
    \'There were undefined references',
    \'Citation %.%# undefined',
    \'Double space found.',
    \'Font Warning',
    \'Package hyperref Warning',
    \'\headheight',
    \'Wrong length of dash',
    \'Package natbib Warning',
    \'Reference',
    \'A float is stuck',
    \]


