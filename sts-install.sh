#!/bin/bash

# java ide
mkdir -p $HOME/dev/sts

sts_version="3.9.1"
major_eclipse_version="4.7"
eclipse_version="4.7.1a"

download_folder=/tmp
download_url=http://download.springsource.com/release/STS/$sts_version.RELEASE/dist/e$major_eclipse_version/spring-tool-suite-$sts_version.RELEASE-e$eclipse_version-linux-gtk-x86_64.tar.gz
archive=$download_folder/sts-$sts_version.tar.gz

install_folder=$HOME/dev/sts

if [ -d "$install_folder/sts-$sts_version" ]; then
    echo "Spring Tool Suite $sts_version already installed"
    exit 0
fi

wget -O $archive $download_url 

tar -xzvf $archive -C $install_folder 

mv $install_folder/sts-bundle $install_folder/sts-$sts_version
mv $install_folder/sts-$sts_version/sts-$sts_version.RELEASE $install_folder/sts-$sts_version/sts
ln -nfs $install_folder/sts-$sts_version $install_folder/current

rm $archive 

echo "Creating symlink for sts"
sudo ln -nfs $install_folder/current/sts/STS /usr/local/bin/spring-tool-suite

