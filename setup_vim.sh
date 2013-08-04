#!/bin/bash

# Prerequisites:
sudo apt-get build-dep vim
sudo apt-get install curl git mercurial

# build & install vim from source
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim

# install spf13-vim stuff
curl http://j.mp/spf13-vim3 -L -o - | sh

# add my local configuration
ln .vimrc.local ~/.vimrc.local
ln .vimrc.bundles.local ~/.vimrc.bundles.local
vim +BundleInstall +BundleClean +q

