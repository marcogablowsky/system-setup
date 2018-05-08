#!/bin/bash

set -e
scriptdir="$( cd "$( dirname "$0" )" && pwd )"
. $scriptdir/utils.sh

packages="htop lm_sensors curl git tmux gtypist zsh ranger pandoc cowsay cmatrix texlive-core texlive-latexextra"
install_packages $packages

echo $scriptdir
if [ -z $(echo $SHELL | grep zsh) ]; then
  echo "Setting zsh as default shell"
  chsh -s $(which zsh) $(whoami)
  ln -nfs $scriptdir/config/zshrc ~/.zshrc
fi
