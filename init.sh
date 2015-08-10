#!/bin/bash

VIMVER=$(vim --version | head -n1 | sed -r 's/^.*([0-9]+\.[0-9]+).*$/\1/')

if awk "BEGIN{exit ${VIMVER} < 7.4 ? 0 : 1}"; then
  ln -s ~/.vim/vimrc ~/.vimrc
fi  

cd ~/.vim/bundle
if [ ! -e Vundle.vim/.git/config ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
fi
vim +PluginInstall +qall

