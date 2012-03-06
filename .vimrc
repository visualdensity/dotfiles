" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
" set cindent
" set paste - set this on, auto-indent won't work
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start      " more powerful backspacing
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
set tw=84 "maximum characters in a line before wrapping
set winheight=5
set winminheight=5
set winheight=999

syntax on

"Keybinding for paste mode
set pastetoggle=<C-0>

au BufRead,BufNewFile *.thtml   set ft=php
au BufRead,BufNewFile *.twig    set ft=php
au BufRead,BufNewFile *.ctp     set ft=php

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" Pathogen
call pathogen#infect()

let mapleader=','
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%
map <leader>v :view %%

filetype plugin indent on

" Symfony2 mappings for CommandT plugin
map <leader>sb :CommandTFlush<cr>\|:CommandT src/<cr>
map <leader>sa :CommandTFlush<cr>\|:CommandT app/<cr>
map <leader>sw :CommandTFlush<cr>\|:CommandT web/<cr>
map <leader>ss :CommandTFlush<cr>\|:CommandT vendor/<cr>

"map <leader>sc :topleft :split app/config/config.xml<cr>
"map <leader>sx :topleft 100 :split app/config/security.xml<cr>
