git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull

cp .vimrc ~/
cp -R .vim ~/
#cd ~/.vim/bundle/command-t
#rake make
