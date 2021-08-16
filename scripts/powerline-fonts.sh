#!/bin/bash
mkdir -p ~/.Matrix/.fonts/powerline/
cd ~/.Matrix/.fonts/powerline/
rm -rf fonts
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
