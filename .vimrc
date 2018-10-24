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

call plug#begin('~/.vim/plugged')
Plug '~/.fzf'
call plug#end()

" My lead
let mapleader=','

set backspace=indent,eol,start
set number
set encoding=utf-8
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cinkeys=0{,0},:,0#,!^F
set expandtab
set shiftround
set tw=84 "maximum characters in a line before wrapping
set nowrap
"set winheight=15
"set winminheight=15
"set winheight=999
set modelines=1 "Mac OS X fix - http://unix.stackexchange.com/questions/19875/setting-vim-filetype-with-modeline-not-working-as-expected
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

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"====[ Make the 81st column stand out ]====================
"

    " OR ELSE just the 81st column of wide lines...
    "highlight ColorColumn ctermbg=magenta
    "call matchadd('ColorColumn', '\%75v', 100)

    " EITHER the entire 81st column, full-screen...
    " highlight ColorColumn ctermbg=magenta
    " set colorcolumn=75

"====[ Make the 81st column stand out ]====================

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>

    " EITHER blink the line containing the match...
    function! HLNext (blinktime)
        set invcursorline
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        set invcursorline
        redraw
    endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
"
"    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"    set list

"====[ Open any file with a pre-existing swapfile in readonly mode "]=========

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echomsg ErrorMsg
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 2
    augroup END

    " Also consider the autoswap_mac.vim plugin (but beware its limitations)


" ,<space> to clear off search input * hlsearch
nnoremap <leader><space> :noh<cr> 

" Keybinding for paste mode
set pastetoggle=<F2>

" Removes all trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" %% shows current location
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" FZF integration
set rtp+=~/.fzf
nnoremap <silent> <Leader>sf :FZF! <CR>

" Open up ~/.vimrc quick!
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Theme
set background=dark

" Buffer filetype
au BufRead,BufNewFile *.less     set ft=css
au BufRead,BufNewFile *.scss     set ft=sass
au BufRead,BufNewFile *.coffee   set ft=coffee
au BufRead,BufNewFile *.ino      set ft=cpp
au BufRead,BufNewFile *.template set ft=json

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" fixes term color issue
let &t_Co=256

" indentLine 
let g:indentLine_enabled = 0
nnoremap <silent> <Leader>v :IndentLinesToggle<CR>
