# build YCM if we are oin 7.3 or greater

# this only works on recent Debian, Ubuntu and Fedora

VIMVER=$(vim --version | head -n1 | sed -r 's/^.*([0-9]+\.[0-9]+).*$/\1/')

if awk "BEGIN{exit ${VIMVER} >= 7.3 ? 0 : 1}"; then
  couldNot=1
  ycmInstOpt=""
  hash apt-get >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    apt-get install -y clang cmake xz-utils python-all-dev && couldNot=0
  else
    hash yum >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      if grep Fedora /etc/redhat-release; then
        yum install -y xz gcc clang cmake make python-devel && couldNot=0
        ycmInstOpt=""
      fi
    fi
  fi
  if [ $couldNot -eq 0 ]; then
    if [ ! -e ~/.vim/bundle/YouCompleteMe/.git/config ]; then
      cd ~/.vim/bundle
      git clone https://github.com/Valloric/YouCompleteMe.git
    fi
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    ./install.sh --clang-completer ${ycmInstOpt}
  else
    echo "Could not install prerequisites or compile for YCM."
  fi
fi
