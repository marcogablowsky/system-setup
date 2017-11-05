#!/bin/bash

set -e

# remove openjdk
sudo apt-get purge openjdk-\* 

JDK_PACKAGE_PATH="$1"
JDK_PACKAGE=$(basename $JDK_PACKAGE_PATH)
TMPDIR=/tmp/jdk
INSTALLDIR=/usr/local/java

cleanup(){
    rm -rf $1
}

# extract to temporary directory
cleanup $TMPDIR

mkdir -p $TMPDIR
cp $JDK_PACKAGE_PATH $TMPDIR
cd $TMPDIR
tar xvzf "$JDK_PACKAGE"

# move to target and link
ARCHIVE_CONTENT="$(find . -mindepth 1 -maxdepth 1 -type d -printf '%f')"

if [ -d "$INSTALLDIR/$ARCHIVE_CONTENT" ]; then
    echo "$ARCHIVE_CONTENT already installed"
    cleanup $TMPDIR
    exit 0
fi

sudo mkdir -p $INSTALLDIR
sudo mv $ARCHIVE_CONTENT $INSTALLDIR
sudo chown -R root:root $INSTALLDIR/$ARCHIVE_CONTENT

cd $INSTALLDIR
sudo ln -nfs $ARCHIVE_CONTENT current

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/current/bin/java" 1 
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/current/bin/javac" 1 
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/current/bin/javaws" 1 

cleanup $TMPDIR
