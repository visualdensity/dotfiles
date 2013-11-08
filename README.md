# RC Files

In the [footsteps](/holman/dotfiles) [of](/garybernhardt/dotfiles)
[others](/ryanb/dotfiles), I have decided to start managing my rc or dotfiles
proactively so I can easily rebuild my environment easily.

This repo includes `Vim` with `Pathogen`, `Fugitive` and `CommandT` installed, 
my `.gitconfig` and `.bashrc` files, etc. It also contains a few setup 
scripts that helps me install what I need on new servers very quickly. It may 
not necessarily apply to your environment so please use it at your own risk.

## Dependencies (Manual Install)
Several packages needs to be installed first before this would work - below 
applies ONLY to my situation (only works if this sequence is followed):

    apt-get install ruby ruby-dev
    apt-get install rubygems
    gem install rake
    apt-get install rake

Optional (if you would like to install `oh-my-zsh`):

    apt-get install zsh

## Installation
Here's a typical setup process that I use when it's a brand new install. These
are also automated in the `setup.sh -a`

    git submodule init
    git submodule update
    git submodule foreach git checkout master
    git submodule foreach git pull
    
    cp .vimrc ~/
    cp -R .vim ~/
    cd ~/.vim/bundle/command-t
    rake make

If you want to install `zsh`:

    ./setup_zsh.sh

### On Mac OS (tested on Snow Leopard, Lion)
To get everything running, especially command-T, you need to first install XCode for
the build tools. If it still doesn't work, try installing command line tools via
Xcode using the following steps:

  1. Preferences
  2. Go to Downloads tab
  3. Click 'Install' on the 'Command Line Tools'


## Other Installables

I have aliases that wraps around the following:

  * AWS CLI - http://aws.amazon.com/cli/
  * Pygments - http://pygments.org/
