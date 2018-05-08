#!/bin/bash

set -e
scriptdir="$( cd "$( dirname "$0" )" && pwd )"
. $scriptdir/utils.sh

packages="i3-gaps i3blocks i3lock dmenu feh compton evince"
install_packages $packages

ln -nfs $scriptdir/config/i3 ~/.i3
