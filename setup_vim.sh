#!/bin/bash

WD=`pwd`

# Prerequisites:
sudo apt-get build-dep vim
sudo apt-get install curl git mercurial

# build & install vim from source
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
ln -s $HOME/opt/vim/bin/vim $HOME/bin

# install spf13-vim stuff
curl http://j.mp/spf13-vim3 -L -o - | sh

# add my local configuration
ln -fs $WD/.vimrc.local $HOME
ln -fs $WD/.vimrc.bundles.local $HOME
vim +BundleInstall +BundleClean +qall!

