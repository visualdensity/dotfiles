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

" Enable autocompletion
set omnifunc=syntaxcomplete#Complete
" " Select keyword as you type
set completeopt=longest,menuone

set backspace=indent,eol,start
set number
set encoding=utf-8
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cinkeys=0{,0},:,0#,!^F
set expandtab
set shiftround
set tw=84 "maximum characters in a line before wrapping
set nowrap
set modelines=1 "Mac OS X fix - http://unix.stackexchange.com/questions/19875/setting-vim-filetype-with-modeline-not-working-as-expected
set modeline

" Vertical lines for tabs
set list lcs=tab:\¦\  

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
" set background=dark
colorscheme molokai

" Buffer filetype
au BufRead,BufNewFile *.less     set ft=css
au BufRead,BufNewFile *.scss     set ft=sass
au BufRead,BufNewFile *.coffee   set ft=coffee
au BufRead,BufNewFile *.ino      set ft=cpp
au BufRead,BufNewFile *.template set ft=json
au BufRead,BufNewFile *.go       set ft=go

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" fixes term color issue
let &t_Co=256

" tmux run-shell with output to pane #1
nnoremap <leader>rr :!tmux run-shell -t 1 -b ./%<CR>

" vim-go specific
let g:go_fmt_autosave=1  " gofmt uses tabs by standard
let g:go_fmt_options = "-tabwidth=2"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

nnoremap <leader>gr :GoRun %<CR>
nnoremap <leader>gd :GoDef<CR>

" GitGutter
nnoremap <leader>gt :GitGutterToggle<CR>

" IndentLine plugin
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <silent> <Leader>v :IndentLinesToggle<CR>
au BufRead,BufEnter,BufNewFile * IndentLinesReset
