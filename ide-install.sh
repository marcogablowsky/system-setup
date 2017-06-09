#!/bin/bash

# java ide
mkdir -p $HOME/dev/sts

wget -O sts-3.8.4.tar.gz http://download.springsource.com/release/STS/3.8.4.RELEASE/dist/e4.6/spring-tool-suite-3.8.4.RELEASE-e4.6.3-linux-gtk-x86_64.tar.gz

tar -xzvf sts-3.8.4.tar.gz -C $HOME/dev/sts/

rm sts-3.8.4.tar.gz
