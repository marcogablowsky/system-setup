#!/bin/bash

set -e

# add ppa for backport of vim 8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt install htop curl git vim tmux gtypist zsh ranger lm-sensors texlive texlive-latex-extra texlive-lang-german pandoc cowsay cmatrix -y

# setup zsh
echo "Setting zsh as default shell"
chsh -s $(which zsh)

# install ale plugin for vim 8
if [ ! -d ~/.vim/pack/git-plugins/start/ale ]; then
  mkdir -p ~/.vim/pack/git-plugins/start
  git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale
fi
