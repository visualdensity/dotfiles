#!/bin/bash

# Setup script
#
# By default the script only runs updates to git modules
# in the repository for updating any vim-related stuff
#
# To perform a full install, run setup with -a option

function help {
    echo "Usage: ./setup.sh [option]"
    echo "This will initialise most vim plugins and bundles and then copies them over to the right places"
    echo "      -a Full install including ruby, gems, rake and zsh - Only works on DEBIAN-based distros!"
    exit 0
}

function blah () {
    echo -e '\E[33m'"$1" '\E[0m'
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
    sudo apt-get install ruby ruby-dev
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

if [ -n "$all" ]; 
then
    blah 'Installing oh-my-zsh...'
    ./setup_zsh.sh
fi

blah 'Done!'
