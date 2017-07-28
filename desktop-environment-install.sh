#!/bin/bash

sudo apt-get update && sudo apt-get install i3 i3blocks feh lxappearance rofi compton evince -y

# download and install fonts

fonts_folder=~/.fonts
download_folder=/tmp
unpack_target=$download_folder/unpacked-fonts
fa_archive=$download_folder/font-awesome.tar.gz
yosemite_archive=$download_folder/yosemite-sf-font.zip

fa_url=https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.tar.gz
yos_sf_url=https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip


wget -O $fa_archive $fa_url
wget -O $yosemite_archive $yos_sf_url

mkdir -p $unpack_target
tar -xzvf $fa_archive -C $unpack_target
unzip $yosemite_archive -d $unpack_target

mkdir -p $fonts_folder
mv $unpack_target/Font-Awesome-4.7.0/fonts/fontawesome-webfont.ttf $fonts_folder/fontawesome-webfont.ttf
mv $unpack_target/YosemiteSanFranciscoFont-master/*.ttf $fonts_folder/

rm $fa_archive $yosemite_archive
rm -rf $unpack_target

# install Arc GTK theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme -y

# install moka icon theme
sudo add-apt-repository ppa:moka/daily
sudo apt-get update
sudo apt-get install moka-icon-theme faba-icon-theme faba-mono-icons -y
