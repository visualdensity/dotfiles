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

"====[ Pathogen ]====
call pathogen#helptags()
call pathogen#infect() " ~/.vim/autoload/pathogen.vim

"====[ VIM Plug ]====
call plug#begin('~/.vim/plugged')
  " Syntax highlighter for various languages
  Plug 'sheerun/vim-polyglot'

  " FZF search capability
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Commenter
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'

  " Prettier and more useful statusline
  Plug 'itchyny/lightline.vim'

  " Vim-go
  Plug 'fatih/vim-go'

  " Vim-monokai-tasty color theme
  Plug 'patstockwell/vim-monokai-tasty'
call plug#end()


"====[ vim configs ]====
filetype plugin indent on
let &t_Co=256
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
set tw=100 "maximum characters in a line before wrapping
set nowrap
set modelines=1 "Mac OS X fix - http://unix.stackexchange.com/questions/19875/setting-vim-filetype-with-modeline-not-working-as-expected
set modeline
set laststatus=2 " For lightline. More customisation: https://github.com/itchyny/lightline.vim
set ignorecase " Ignore case and search intelligently
set smartcase
"set colorcolumn=100
set incsearch
set showmatch
set hlsearch
set cursorline
highlight ColorColumn ctermbg=1

" Vertical lines for tabs
set list lcs=tab:\¦\

" Regexp reset & search
nnoremap / /\v
vnoremap / /\v

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list

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


""
" ====[ Leader Mappings ]====
""
  " My leader key
  let mapleader=','

  " Toggle Relative numbering
  nnoremap <leader>r :set rnu!<cr>

  " Toggle cursorline
  nnoremap <leader>l :set cursorline!<cr>

  " ,<space> to clear off search input * hlsearch
  nnoremap <leader><space> :noh<cr>

  " Removes all trailing whitespaces
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

  " %% shows current location
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>e :edit %%

  " FZF integration
  set rtp+=~/.fzf
  let g:fzf_preview_window = []
  let g:fzf_layout = { 'down':  '25%'}
  nnoremap <silent> <Leader>sf :Files<CR>

  " Nerdtree
  " Press m to bring up the NERDTree Filesystem Menu. This menu allows you to create, rename, and
  " delete files and directories. Type a to add a child node and then simply enter the filename.
  " For directories/folders, end with a /
  nnoremap <silent> <Leader>nt :NERDTreeToggle <CR>

  " Open up ~/.vimrc quick!
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

  " CoC
  nmap <leader><leader>d <Plug>(coc-definition)
  nmap <leader><leader>r <Plug>(coc-references)

  " vim-go stuff
  let g:go_fmt_autosave=1  " gofmt uses tabs by standard
  let g:go_fmt_options = "-tabwidth=2"
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  nnoremap <leader>gr :GoRun %<CR>
  nnoremap <leader>gd :GoDef<CR>

  "GitGutter
  nnoremap <leader>gt :GitGutterToggle<CR>

  "IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  nnoremap <silent> <Leader>v :IndentLinesToggle<CR>


"====[ Theme ]====
  set background=dark
  "colorscheme molokai
  colorscheme vim-monokai-tasty


"====[ Buffer filetype ]====
  au BufRead,BufEnter,BufNewFile * IndentLinesReset
  au BufRead,BufNewFile *.less     set ft=css
  au BufRead,BufNewFile *.scss     set ft=sass
  au BufRead,BufNewFile *.coffee   set ft=coffee
  au BufRead,BufNewFile *.ino      set ft=cpp
  au BufRead,BufNewFile *.template set ft=json
  au BufRead,BufNewFile *.go       set ft=go
  au BufRead,BufNewFile *.tf       set ft=terraform

"====[ MISC stuff ]====
  " Don't write backup file if vim is being called by "crontab -e"
  au BufWrite /private/tmp/crontab.* set nowritebackup
  " Don't write backup file if vim is being called by "chpass"
  au BufWrite /private/etc/pw.* set nowritebackup

"====[ TMUX - run-shell with output to pane #1 ]====
  nnoremap <leader>rr :!tmux run-shell -t 1 -b ./%<CR>
  nnoremap <leader>tt :silent !tmux send -t 0 'npm run build' Enter <CR>:redraw!<CR>




" ========================================
"
"    CoC Plugin Configuration
"    A direct copy from:
"    https://github.com/neoclide/coc.nvim
"
" ========================================

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
