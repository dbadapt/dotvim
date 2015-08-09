#!/bin/bash

VIMVER=$(vim --version | head -n1 | sed -r 's/^.*([0-9]+\.[0-9]+).*$/\1/')

cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
vim +PluginInstall +qall

# build YCM if we are oin 7.3 or greater
if awk "BEGIN{exit ${VIMVER} >= 7.3 ? 0 : 1}"; then
  # for ycm
  if hash apt-get; then
    apt-get update -y
    apt-get install -y clang cmake xz-utils python-all-dev
  fi

  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh --clang-completer
fi
exit;
