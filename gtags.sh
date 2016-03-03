# no shebang - run in current context

hash gtags 2>/dev/null || {
  if hash apt-get 2>/dev/null; then
    sudo apt-get install -y global
  elif hash yum 2>/dev/null; then
    sudo yum install -y global
  fi
}

hash gtags 2>/dev/null || {
  echo "Install GNU global for tag support"

}

if grep -q '^# begin:gtags-cscope' ~/.bashrc; then
  sed -i.bak '/# begin:gtags-cscope/,/# end:gtags-cscope/d' ~/.bashrc
fi

cat << 'EOF' >> ~/.bashrc
# begin:gtags-cscope
export MAKEOBJDIRPREFIX=$HOME/.vim/globaltags
alias maketags='mkdir -p $MAKEOBJDIRPREFIX/$(pwd -P) && gtags -i $MAKEOBJDIRPREFIX/$(pwd -P)'
alias maketags_cpp='GTAGSFORCECPP=1 $(maketags)'
# end:gtags-cscope
EOF

. ~/.bashrc

