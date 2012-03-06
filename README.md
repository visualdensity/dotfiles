RC Files
========

My RC Files, starting with my Vim with Pathogen, Fugitive and CommandT
installed.


Installation
------------

    git glone git@github.com:visualdensity/rcfiles.git ~/ 
    git submodule init
    git submodule update
    git submodule foreach checkout master
    # Build CommandT extension
    cd ~/.vim/bundle/command-t/
    rake make
