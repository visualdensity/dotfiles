RC Files
========

My own dot rc files, starting with my `Vim` with `Pathogen`, `Fugitive` and 
`CommandT` installed. It contains a few setup scripts that helps me install 
what I need on new servers very quickly. It may not necessarily apply to your 
environment so please use it at your own risk.

Dependencies
------------
Several packages needs to be installed first before this would work - below 
applies ONLY to my situation (only works if this sequence is followed):

    apt-get install ruby
    apt-get install rubygems
    gem install rake
    apt-get install rake

Optional (if you would like to install `oh-my-zsh`):

    apt-get install zsh

Installation
------------
Here's a typical setup process that I use when it's a brand new install. These
are also automated in the `setup.sh`

    git submodule init
    git submodule update
    git submodule foreach git checkout master
    git submodule foreach git pull
    
    cp .vimrc ~/
    cp -R .vim ~/
    cd ~/.vim/bundle/command-t
    rake make

If you want to install `zsh`
    ./setup_zsh.sh
