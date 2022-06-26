# RC Files

In the footsteps of others, I have decided to start managing my rc or dotfiles so
I can easily rebuild my environment.

This repo includes `vim` with [Pathogen](https://github.com/tpope/vim-pathogen), [Plug](https://github.com/junegunn/vim-plug) installed, along with my `.gitconfig`,
`tmux.conf` and `.bashrc` files, etc. It also contains a few setup scripts that helps
me install what I need on new machines very quickly. It may not necessarily apply to
your environment so please use it at your own risk.

# Dependencies

Best to run with the following installed:
  * VIM > 8.2
  * NodeJS with yarn (via npm)

# Post-Install Setup

In `vim`, install all [Plug](https://github.com/junegunn/vim-plug) extensions first:
```
:PlugInstall
```
After that, install `CoC` extensions for code completion support:
```
:CocInstall coc-json coc-tsserver coc-go
```
More extensions can be found on [CoC project](https://github.com/neoclide/coc.nvim).
