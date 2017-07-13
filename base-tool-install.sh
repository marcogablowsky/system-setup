#!/bin/bash

sudo apt-get update && sudo apt-get install htop curl git maven vim tmux gtypist zsh cowsay cmatrix -y

# setup zsh
chsh -s $(which zsh)

nvm_version=v0.33.2

# nvm and node
wget -qO- https://raw.githubusercontent.com/creationix/nvm/$nvm_version/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install --lts 

