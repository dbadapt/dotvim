#!/bin/bash

cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
vim +PluginInstall +qall
