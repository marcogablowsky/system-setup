#!/bin/bash

set -e

# java ide
mkdir -p $HOME/dev/sts

sts_version="4.0.1.RELEASE"
major_eclipse_version="4.9"
eclipse_version="4.9.0"

download_folder=/tmp
download_url=https://download.springsource.com/release/STS4/$sts_version/dist/e$major_eclipse_version/spring-tool-suite-4-$sts_version-e$eclipse_version-linux.gtk.x86_64.tar.gz
archive=$download_folder/sts-$sts_version.tar.gz

install_folder=$HOME/dev/sts

if [ -d "$install_folder/sts-$sts_version" ]; then
    echo "Spring Tool Suite $sts_version already installed"
    exit 0
fi

wget -O $archive $download_url 

tar -xzvf $archive -C $install_folder 

ln -nfs $install_folder/sts-$sts_version $install_folder/current

rm $archive 

echo "Creating symlink for sts"
sudo ln -nfs $install_folder/current/SpringToolSuite4 /usr/local/bin/spring-tool-suite

