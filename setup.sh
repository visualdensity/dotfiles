#!/bin/bash

# Setup script
#
# By default the script only runs updates to git modules
# in the repository for updating any vim-related stuff
#
# To perform a full install, run setup with -a option

function help {
    echo "Usage: ./setup.sh [option]"
    echo "      -a Full install including ruby, gems, rake and zsh"
    exit 0
}

function blah () {
    #echo -e "\033[1m$1\033[0m" #bold
    echo -e '\E[36m'"$1" 
    tput sgr0
}

while getopts ":ah" opt; do
    case $opt in
        a)
            all=1
            ;;
        h)
            help
            ;;
    esac
done

sudo -v

if [ -n "$all" ]; 
then
    blah 'Installing pre-requisites...'
    sudo apt-get install ruby
    sudo apt-get install rubygems
    sudo gem install rake
    sudo apt-get install rake
    sudo apt-get install zsh
fi

blah 'Initialising and updating modules...'
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull

blah 'Copying files to proper locations...'
cp .gitconfig ~/
cp .vimrc ~/
cp -R .vim ~/

blah 'Buildling command-t...'
cd ~/.vim/bundle/command-t
rake make

if [ -n "$all" ];
then
    blah 'Installing oh-my-zsh...'
    curl -L https://github.com/visualdensity/oh-my-zsh/raw/master/tools/install.sh | sh
    cp aliases.zsh ~/.oh-my-zsh/lib/
fi

blah 'Done!'
