#!/bin/bash

set -e
scriptdir=$(dirname $0)
. $scriptdir/utils.sh

distro=$(get_distro)
if test $distro == 'ubuntu'; then
  # add ppa for backport of vim 8
  sudo add-apt-repository ppa:jonathonf/vim
fi

install_packages "vim"

# install ale plugin for vim 8
if [ ! -d ~/.vim/pack/git-plugins/start/ale ]; then
  mkdir -p ~/.vim/pack/git-plugins/start
  git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale
fi

# install vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
  
ln -nfs $scriptdir/config/vimrc ~/.vimrc

# prelink colorschemes installed later through :PlugInstall
mkdir -p ~/.vim/colors
ln -nfs ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
ln -nfs ~/.vim/plugged/Zenburn/colors/zenburn.vim ~/.vim/colors/zenburn.vim
