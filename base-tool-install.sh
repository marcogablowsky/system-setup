#!/bin/bash

set -e
scriptdir=$(dirname $0)
. $scriptdir/utils.sh

packages="htop lm_sensors curl git tmux gtypist zsh ranger pandoc cowsay cmatrix texlive-core texlive-latexextra"
install_packages $packages

if [ -z $(ps -p $$ | grep zsh) ]; then 
  echo "Setting zsh as default shell"
  chsh -s $(which zsh) $(whoami)
  ln -nfs $scriptdir/config/zshrc ~/.zshrc
fi
