#!/bin/bash

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc

export NVM_DIR="$HOME/.nvm"

nvm install node
nvm install-latest-npm

npm install -g autoprefixer postcss-cli
npm install -g markdown-link-check
npm install -g standard

echo "👓 Installing Sass"
sudo npm install -g sass sass-lint