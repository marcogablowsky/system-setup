#!/bin/bash

MVN_PACKAGE_PATH="$1"
MVN_PACKAGE=$(basename $MVN_PACKAGE_PATH)
TMPDIR=/tmp/maven
INSTALLDIR=/usr/local/maven

cleanup(){
    rm -rf $1
}

# extract to temporary directory
cleanup $TMPDIR

mkdir -p $TMPDIR
cp $MVN_PACKAGE_PATH $TMPDIR
cd $TMPDIR
tar xvzf "$MVN_PACKAGE"

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

cleanup $TMPDIR
