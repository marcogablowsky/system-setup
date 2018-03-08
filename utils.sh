#!/bin/bash

function get_package_install_command() {
  if [ ! -z $(which apt 2>/dev/null) ]; then
    echo 'sudo apt install -y'
  elif [ ! -z $(which pacman 2>/dev/null) ]; then
    echo 'sudo pacman -Sy --needed'
  else
    echo 'No package manager found'
    exit 1
  fi
}

function install_packages() {
  install_command=$(get_package_install_command)
  $install_command $@
}

function get_distro() {  
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo $ID
  else
    echo 'No distro info found'
    exit 1
  fi
}
