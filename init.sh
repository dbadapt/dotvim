#!/bin/bash -xv

VIMVER=$(vim --version | head -n1 | sed -r 's/^.*([0-9]+\.[0-9]+).*$/\1/')

cd ~/.vim/bundle
if [ ! -e Vundle.vim/.git/config ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
fi
vim +PluginInstall +qall

# build YCM if we are oin 7.3 or greater
if awk "BEGIN{exit ${VIMVER} >= 7.3 ? 0 : 1}"; then
  couldNot=1
  ycmInstOpt=""
  hash apt-get >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    apt-get install -y clang cmake xz-utils python-all-dev && couldNot=0
  else
    hash yum >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      rhelver=$(cat /etc/redhat-release | sed -r 's/.*([0-9]+)\..*/\1/')
      if [ ! "${rhelver}" == "" ]; then
        yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-${rhelver}.noarch.rpm
        yum install -y xz gcc clang cmake python-devel && couldNot=0
        ycmInstOpt="--system-libclang"
      fi
    fi
  fi
  if [ $couldNot -eq 0 ]; then
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer ${ycmInstOpt}
  else
    echo "Could not install prerequisites for YCM."
  fi
fi
