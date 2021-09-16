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
"other cool ones: 256noir, twilight256, torte, sunbather, oceanic material"
set number
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'vim-pandoc/vim-rmarkdown'
call plug#end()

"colorscheme ayu"
"other maybe: alduin = soft greyish blue and green , similar: angr but this is strong green, and lucius, but grey is bluer"

set sts=2
set sw=2
"set ts=2"

"search ignores upper or lowercase:"
set ignorecase

"copy-paste across terminals
set clipboard=unnamedplus

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
"saves and runs python with F5, nmap for normal, imap for insert"
nmap <F5> <Esc>:w<CR>:!clear;python %<CR>

"vimtex ignore warnings"
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
    \]

