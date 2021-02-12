# Antigen
[[ ! -d ~/.lib/antigen ]] &&
	mkdir -p ~/.lib && git clone https://github.com/zsh-users/antigen.git ~/.lib/antigen

. ~/.lib/antigen/antigen.zsh

# Source Antigen
# source ${HOME}/antigen.zsh

# PATH
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:/sbin:/usr/sbin
export ZSH=${HOME}/.oh-my-zsh

# Oh My ZSH
antigen use oh-my-zsh

[[ ! -f ~/.zshenv || -z $(grep DEBIAN_PREVENT_KEYBOARD_CHANGES ~/.zshenv) ]] &&
	print "DEBIAN_PREVENT_KEYBOARD_CHANGES=yes" >> ~/.zshenv

# Bundles
antigen bundles <<EOBUNDLES
gretzky/auto-color-ls
chrissicool/zsh-256color
kiurchv/asdf.plugin.zsh
Tarrasch/zsh-autoenv
MichaelAquilina/zsh-autoswitch-virtualenv
unixorn/autoupdate-antigen.zshplugin
bower
colorize
ptavares/zsh-direnv
django
docker
docker-compose
docker-machine
dotenv
emoji
git
gulp
heroku
node
npm
nvm
pip
postgres
pyenv
python
screen
ssh-agent
systemd
virtualenv
vscode
yarn
EOBUNDLES

plugins+=(appup autodotenv autoupdate cheatsheet zsh-colorls)

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Source all the configs
# source ~/.aliases
source ~/.colors
# source ~/.dircolors
# source ~/.env
source ~/.exports
# source ~/.path
# source ~/.prompt
# source ~/.ssh

# Default programs to run.
export EDITOR="code-insiders"
export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3.8"

# Default localization
export LANG=en_US.UTF-8
export TZ=America/New_York

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Tell Antigen that you're done.
antigen apply