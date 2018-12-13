#!/bin/bash

set -e
SCRIPTDIR="$( CD "$( DIRNAME "$0" )" && PWD )"
. $SCRIPTDIR/utils.sh

DISTRO=get_distro

COMMON_PACKAGES="htop curl git tmux gtypist zsh ranger pandoc"

if [ $DISTRO == "manjaro" ]; then
    DIST_PACKAGES="lm_sensors texlive-core texlive-latexextra"
elif [ $DISTRO == "ubuntu" ]; then
    DIST_PACKAGES="lm-sensors texlive texlive-latex-extra texlive-lang-german"
fi

install_packages $COMMON_PACKAGES $DIST_PACKAGES

echo $SCRIPTDIR
if [ -z $(echo $SHELL | grep zsh) ]; then
  echo "Setting zsh as default shell"
  chsh -s $(which zsh) $(whoami)
  ln -nfs $scriptdir/config/zshrc ~/.zshrc
fi
