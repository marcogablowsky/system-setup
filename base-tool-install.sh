#!/bin/bash

# add ppa for backport of vim 8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update && sudo apt-get install htop curl git vim tmux gtypist zsh lm-sensors texlive texlive-latex-extra texlive-lang-german cowsay cmatrix -y

# setup zsh
echo "Setting zsh as default shell"
chsh -s $(which zsh)


