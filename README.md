RC Files
========

My own dot rc files, starting with my Vim with Pathogen, Fugitive and CommandT
installed. It contains a few setup scripts that helps me install what I need
on new servers very quickly. It may not necessarily apply to your environment
so please use it at your own risk.


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
