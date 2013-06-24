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
}

while getopts ":a" opt; do
    case $opt in
        a)
            all=1
            ;;
    esac
done

sudo -v

if [ -n "$all" ]; 
then
    echo 'Installing pre-requisites...'
    sudo apt-get install ruby
    sudo apt-get install rubygems
    sudo gem install rake
    sudo apt-get install rake
    sudo apt-get install zsh
fi

echo 'Initialising and updating modules...'
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull

echo 'Copying files to proper locations...'
cp .gitconfig ~/
cp .vimrc ~/
cp -R .vim ~/

echo 'Buildling command-t...'
cd ~/.vim/bundle/command-t
rake make

echo 'Done!'
