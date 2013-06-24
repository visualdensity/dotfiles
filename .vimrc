" =========================================================
" Configuration file for vim 
" 
" Of course, I haven't created this file entirely
" by hand, from scratch. It's all copy & pasted
" from various sources over the years. :)
" 
" Who: Wee Keat <weekeat@visualdensity.com>
" Git: git@github.com:visualdensity/rcfiles.git
"
" Nice resource:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" =========================================================

" Must come first
set nocompatible
syntax on

filetype off
call pathogen#helptags()
call pathogen#infect() " ~/.vim/autoload/pathogen.vim
filetype plugin indent on

" My lead
let mapleader=','

set backspace=indent,eol,start " more powerful backspacing
set number
set encoding=utf-8
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cinkeys=0{,0},:,0#,!,!^F
set expandtab
set shiftround
"set tw=84 "maximum characters in a line before wrapping
set winheight=15
set winminheight=15
set winheight=999
set modeline

" Ignore case and search intelligently
set ignorecase
set smartcase

" Regexp reset & search
nnoremap / /\v
vnoremap / /\v
set incsearch
set showmatch
set hlsearch
" ,<space> to clear off search input * hlsearch
nnoremap <leader><space> :noh<cr> 

" Keybinding for paste mode
set pastetoggle=<F2>

" Removes all trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" %% shows current location
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Symfony2 mappings for CommandT plugin
map <leader>sr :CommandTFlush<cr>\|:CommandT src/<cr>
map <leader>sa :CommandTFlush<cr>\|:CommandT app/<cr>
map <leader>sw :CommandTFlush<cr>\|:CommandT web/<cr>
map <leader>sv :CommandTFlush<cr>\|:CommandT vendor/<cr>

" Open up ~/.vimrc quick!
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Theme
set background=dark
colorscheme solarized

let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" Buffer filetype
au BufRead,BufNewFile *.ctp     set ft=php
au BufRead,BufNewFile *.twig    set ft=php
au BufRead,BufNewFile *.scss    set ft=sass
au BufRead,BufNewFile *.coffee  set ft=coffee
au BufRead,BufNewFile *.json    set ft=javascipt

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" fixes term color issue
let &t_Co=256
