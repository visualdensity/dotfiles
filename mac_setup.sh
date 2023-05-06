#!/bin/bash

# Setup zsh
echo ""
echo ":::SETUP::Setting up ZSH..."
echo ""
/bin/bash  -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 
cp aliases.zsh ~/.oh-my-zsh/lib/
cp .zshrc ~/

# Setup brew
echo ""
echo ":::SETUP::Installing brew..."
echo ""
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Setup Vim
echo ""
echo ":::SETUP::Setting up NVM for vim plugins..."
/opt/homebrew/bin/brew install nvm

# Setup VIM
echo ""
echo ":::SETUP::Setting up vim..."
/opt/homebrew/bin/brew install vim

# Setup Ansible
echo ""
echo ":::SETUP::Setting up Ansible..."
/opt/homebrew/bin/brew install ansible

# Setup bat - cat with syntax highlighting
echo ""
echo ":::SETUP::Setting up bat..."
/opt/homebrew/bin/brew install bat

# Setup fzf
echo ""
echo ":::SETUP::Setting up fzf..."
/opt/homebrew/bin/brew install fzf

mkdir ~/.nvm
cp .vimrc ~/
cp -R .vim ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Misc needful config files
echo ""
echo ":::SETUP::Copying misc config files..."
cp .gitconfig ~/
cp .tmux.conf ~/


echo ""
echo "DONE!"
exit 0
