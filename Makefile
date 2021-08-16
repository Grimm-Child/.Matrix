#!/bin/bash

###########################################################################################################
## ENV VARIABLES
###########################################################################################################

SHELL := bash
CURDIR := ${PWD}
DOTFILES_DIR := ~/.Matrix/dotfiles
TARGET = ~
PATH := $(DOTFILES_DIR)/bin:${HOME}/.local:${HOME}/.local/bin:${HOME}/.node_modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:${HOME}/bin:${HOME}/google-cloud-sdk/bin:$(PATH)
NVM_DIR := ${HOME}/.nvm

symlinks = aliases \
           bash_profile \
           bashrc \
           colors \
           curl \
           dircolors \
           editorconfig \
           env \
           exports \
           gitconfig \
           gitignore \
           npmrc \
           nvm \
           path \
           profile \
           prompt \
           ssh

###########################################################################################################
## COLORS
###########################################################################################################

# to see all colors, run
# bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'
# the first 15 entries are the 8-bit colors

# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	PURPLE       := $(shell tput -Txterm setaf 4)
	PINK         := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET        := $(shell tput -Txterm sgr0)
else
	BLACK        := "\033[38;5;232m"
	RED          := "\033[1;38;5;9m"
	GREEN        := "\033[38;5;10m"
	YELLOW       := "\033[38;5;11m"
	PURPLE       := "\033[38;5;93m"
	PINK         := "\033[38;5;13m"
	BLUE         := "\033[38;5;4m"
	WHITE        := "\033[38;5;256m"
	RESET        := "\e[0m"
endif

###########################################################################################################
## DEFAULTS
###########################################################################################################

.DEFAULT_GOAL := help
.PHONY: help test_colors

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[99;1m%-20s\033[0m %s\n", $$1, $$2}'

###########################################################################################################
## SET UP
###########################################################################################################
.PHONY: set_up_linux set_up_base set_up_dev set_up_libs set_up_security set_up_fun set_up_all

set_up_linux: ## Run apt update + upgrade + autoremove
	@echo "${BLUE}Updating the package repositories 💻...${RESET}"
	@sleep 1
	sudo apt-get update && sudo apt-get upgrade -y
	@echo "${BLUE}Checking for distribution upgrades 💻...${RESET}"
	@sleep 1
	sudo apt-get dist-upgrade -f
	@echo "${BLUE}Removing unecessary packages 💻...${RESET}"
	@sleep 1
	sudo apt autoremove -y
	@echo "${BLUE}Base system image is up to date 💻...${RESET}"
	@sleep 1

set_up_base: set_up_linux ## Run apt update + upgrade + autoremove + installs base env packages
	@echo "${BLUE}Installing basic packages 💻...${RESET}"
	@sleep 1
	sudo apt-get install -y autoconf automake bash curl exfat-utils file findutils gettext git git-all \
	git-core grep iproute2 libtool make openvpn openssh-server openssl pkgconf postgresql-client-common \
	postgresql postgresql-contrib postgresql-client python python3.8 python3-pip python-openssl sed screen \
	systemd tmux tar ubuntu-wsl util-linux vim wget yarn
	@echo "${BLUE}Finished installing basic packages 💻...${RESET}"
	@sleep 1

set_up_dev: set_up_linux set_up_base ## Run apt update + upgrade + autoremove + installs base env packages + installs dev env packages
	@echo "${BLUE}Removing nodejs-legacy to avoid conflicts...${RESET}"
	@sleep 1
	sudo apt-get remove -y nodejs-legacy
	@echo "${BLUE}Installing the packages required for development 💻...${RESET}"
	@sleep 1
	sudo apt-get install -y apache2 autoconf automake awscli build-essential direnv g++ gcc git-secrets \
	keychain debootstrap imagemagick llvm python3-venv tk dconf-editor rsync xz-utils libnode64 \
	shellcheck bash-completion sshfs syncthing man-db node-gyp
	@echo "${BLUE}Finished installing dev packages 💻...${RESET}"
	@sleep 1

set_up_libs: ## Installs library packages
	@echo "${BLUE}Better install some 💻 libraries if you don't want things breaking...${RESET}"
	@sleep 1
	sudo apt-get install -y libapache2-mod-wsgi libbz2-dev libexpat1-dev libffi-dev libgdbm-dev liblzma-dev libmysqlclient-dev \
	libncurses5-dev libncursesw5-dev libpq-dev libpython2-dev libpython3-dev libreadline-dev \
	libsqlite3-dev libssl-dev zlib1g-dev tcl-dev tk-dev
	@echo "${BLUE}Finished installing dev library packages 💻...${RESET}"
	@sleep 1

set_up_security: ## Installs security related packages
	@echo "${BLUE}Fixing vulnerabilities 💻...${RESET}"
	@sleep 1
	sudo apt-get install -y apt-transport-https ca-certificates linux-headers-generic \
	software-properties-common
	@echo "${BLUE}Security up to date 💻...${RESET}"
	@sleep 1

set_up_fun: ## Installs unnecessary things for my amusement
	@echo "${BLUE}All work and no play is boring 💻...${RESET}"
	@sleep 1
	sudo apt-get install -y figlet fonts-powerline lolcat
	@echo "${BLUE}Fun stuff installed 💻...${RESET}"
	@sleep 1

set_up_services: ## Sets services like Docker and Postgres to start automatically
	@echo "${BLUE}Setting services to auto-start 💻...${RESET}"
	@sleep 1
	cp ./wsl/scripts/start_services.sh ~/.local/bin
	chmod +x ~/.local/bin/start_services.sh
	@echo "${BLUE}Script has been placed. Please run 'sudo visudo' and add '<username> ALL=(root) NOPASSWD: /home/<username>/.local/bin/start_services.sh' to the bottom....${RESET}"
	@echo "${BLUE}Consult the 'read_me' file for the finishing steps on Windows... 💻...${RESET}"

set_up_all: set_up_linux set_up_base set_up_dev set_up_libs set_up_security set_up_services set_up_fun ## Runs all the initial setup

###########################################################################################################
## DOTFILES
###########################################################################################################
.PHONY: dotfiles_create dotfiles_install $(symlinks)

dotfiles_create: ## Create all dotfiles
	@echo "${BLUE}Creating symlinks to ✏️ dotfiles...${RESET}"
	@sleep 1
	$(symlinks)
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

dotfiles_install: $(symlinks) ## Install all dotfiles
	@echo "${BLUE}Creating symlinks to ✏️ dotfiles and installing...${RESET}"
	@sleep 1
	ln -fsn $(CURDIR)/bin $(TARGET)/bin
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

$(symlinks): ## Create symbolic link in home to dotfile
	@if [ -e $(TARGET)/.$@ ]; then \
		if [ -L $(TARGET)/.$@ ]; then \
			rm -f $(TARGET)/.$@; \
		else \
			echo mv $(TARGET)/.$@ $(TARGET)/$@-old; \
			mv $(TARGET)/.$@ $(TARGET)/$@-old; \
		fi \
	fi
	ln -sn $(CURDIR)/$@ $(TARGET)/.$@

###########################################################################################################
## PYTHON / PIP
###########################################################################################################
.PHONY: pip_install pip_django pip_backup pip_recover pip_update

pip_install: ## Installs the Python packages I use for basically everything
	@echo "${BLUE}Creating a local 🐍 folder...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.local
	#@echo "${BLUE}Installing 🐍 pip...${RESET}"
	#@sleep 1
	#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	#@echo "${BLUE}Defaulting to user install 🐍...${RESET}"
	#@sleep 1
	#export alias pip="python3.8 -m pip"
	@echo "${BLUE}Installing 🐍 Python packages...${RESET}"
	@sleep 1
	pip install --user --upgrade pip
	pip install --user ansible
	pip install --user ansible-lint
	pip install --user autopep8
	pip install --user black
	pip install --user cheat
	pip install --user diagrams
	pip install --user django
	pip install --user faker
	pip install --user flake8
	pip install --user gif-for-cli
	pip install --user graph-cli
	pip install --user httpie
	pip install --user importmagic
	pip install --user ipywidgets
	pip install --user jedi
	pip install --user litecli
	pip install --user matplotlib
	pip install --user neovim
	pip install --user nose
	pip install --user pandas
	pip install --user Pillow
	pip install --user pipenv
	pip install --user poetry
	pip install --user pre-commit
	pip install --user progressbar2
	pip install --user psycopg2
	pip install --user psycopg2-binary
	pip install --user py-spy
	pip install --user pydoc_utils
	pip install --user pyflakes
	pip install --user pylint
	pip install --user python-language-server
	pip install --user r7insight_python
	pip install --user redis
	pip install --user requests_mock
	pip install --user rope
	pip install --user rtv
	pip install --user scipy
	pip install --user scrapy
	pip install --user seaborn
	pip install --user speedtest-cli
	pip install --user streamlink
	pip install --user tldr
	pip install --user trash-cli
	pip install --user truffleHog
	pip install --user virtualenv
	pip install --user virtualenvwrapper
	pip install --user yapf
	rm -fr get-pip.py
	@echo "${BLUE}Finished 🐍...${RESET}"
	@sleep 1

pip_django: ## Install Django
	@echo "${BLUE}Creating 🐍 Django directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/src_code/github.com/grimm-child/Django;\
	cd ${HOME}/src_code/github.com/grimm-child/Django;\
	@echo "${BLUE}Setting up 🐍 env...${RESET}"
	@sleep 1
	touch Pipfile;\
	pipenv --python=3.8.6;\
	@echo "${BLUE}Installing 🐍 Django...${RESET}"
	@sleep 1
	pipenv install django;\
	@echo "${BLUE}Creating 🐍 project...${RESET}"
	@sleep 1
	pipenv run django-admin startproject config .
	@echo "${BLUE}Project 🐍 created...${RESET}"
	@sleep 1

pip_backup: ## Backup Python packages
	@echo "${BLUE}Creating 🐍 backup directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.Matrix/.backups/pip
	@echo "${BLUE}Freezing 🐍 requirements...${RESET}"
	@sleep 1
	pip freeze > ${HOME}/.Matrix/.backups/pip/requirements.txt
	@echo "${BLUE}Finished ...${RESET}"
	@sleep 1

pip_recover: ## Recover Python packages
	@echo "${BLUE}Checking for 🐍 backup directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.Matrix/.backups/pip
	@echo "${BLUE}Installing 🐍 backup...${RESET}"
	@sleep 1
	pip install --user -r ${HOME}/.Matrix/.backups/pip/requirements.txt
	@echo "${BLUE}Finished...${RESET}"
	@sleep 1

pip_update: ## Update Python packages
	@echo "${BLUE}Updating 🐍 Python packages...${RESET}"
	@sleep 1
	pip list --user | cut -d" " -f 1 | tail -n +3 | xargs pip install -U --user
	@echo "${BLUE}Packages updated...${RESET}"
	@sleep 1

###########################################################################################################
## NPM / NVM
###########################################################################################################
.PHONY: npm_nvm npm_packages npm_node npm_update npm_clean

npm_nvm: ## Actually installs NVM
	@echo "${BLUE}Checking for 🟠 NVM directory...${RESET}"
	@sleep 1
	if ! [ -d $(NVM_DIR)/.git ]; then git clone https://github.com/creationix/nvm.git $(NVM_DIR); fi
	. $(NVM_DIR)/nvm.sh; nvm install --lts
	@echo "${BLUE}NVM is installed...${RESET}"
	@sleep 1

npm_packages: npm_nvm ## Installs NVM, if necessary, then installs packages
	@echo "${BLUE}Installing 🟠 NPM packages...${RESET}"
	@sleep 1
	. $(NVM_DIR)/nvm.sh; npm install -g $(shell cat install/npmfile)
	@echo "${BLUE}Finished...${RESET}"
	@sleep 1

npm_node: ## Install node packages
	@echo "${BLUE}Installing 🧶 Yarn...${RESET}"
	@sleep 1
	sudo apt-get install -y yarn
	@echo "${BLUE}Creating 🧶 modules directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.node_modules
	@echo "${BLUE}Installing 🧶 modules...${RESET}"
	@sleep 1
	$ yarn global add babel-eslint
	$ yarn global add bash-language-server
	$ yarn global add cloc
	$ yarn global add create-component-app
	$ yarn global add dockerfile-language-server-nodejs
	$ yarn global add esbuild-linux-64
	$ yarn global add eslint
	$ yarn global add eslint-cli
	$ yarn global add expo-cli
	$ yarn global add firebase-tools
	$ yarn global add fx
	$ yarn global add gulp
	$ yarn global add gulp-cli
	$ yarn global add heroku
	$ yarn global add indium
	$ yarn global add intelephense
	$ yarn global add javascript-typescript-langserver
	$ yarn global add jshint
	$ yarn global add logo.svg
	$ yarn global add @marp-team/marp-cli
	$ yarn global add mermaid
	$ yarn global add mermaid.cli
	$ yarn global add netlify-cli
	$ yarn global add ngrok
	$ yarn global add now
	$ yarn global add prettier
	$ yarn global add parcel-bundler
	$ yarn global add typescript-language-server
	$ yarn global add webpack
	@echo "${BLUE}🧶 Finished...${RESET}"
	@sleep 1

npm_update: ## Update NPM
	@echo "${BLUE}Updating 🟠 NPM...${RESET}"
	@sleep 1
	npm install npm -g
	npm update -g
	@echo "${BLUE}NPM is up to date...${RESET}"
	@sleep 1

npm_clean: ## Clean the NVM cache
	@echo "${BLUE}Cleaning up the 🟠 NVM cache...${RESET}"
	@sleep 1
	. "$(NVM_DIR)/nvm.sh"; nvm cache clear
	@echo "${BLUE}All clean...${RESET}"
	@sleep 1

###########################################################################################################
## SSH
###########################################################################################################
.PHONY: ssh keyring localhost

ssh: ## Init ssh
	@echo "${BLUE}Creating 🔑 the directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.ssh
	@echo "${BLUE}Symlinking the 🔑 config...${RESET}"
	@sleep 1
	ln -vsf ${HOME}/.Matrix/.config/.ssh/config ${HOME}/.ssh/config
	@echo "${BLUE}Checking 🔑 known hosts...${RESET}"
	@sleep 1
	ln -vsf ${HOME}/.Matrix/.config/.ssh/known_hosts ${HOME}/.ssh/known_hosts
	@echo "${BLUE}Modifying permissions...${RESET}"
	@sleep 1
	chmod 600 ${HOME}/.ssh/id_rsa
	@echo "${BLUE}Ssh is set up...${RESET}"
	@sleep 1

keyring: ## Init gnome keyrings
	@echo "${BLUE}Installing 🔑 keyring...${RESET}"
	@sleep 1
	sudo apt-get install -y seahorse
	@echo "${BLUE}Creating 🔑 local files...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.local/share
	@echo "${BLUE}Testing...${RESET}"
	@sleep 1
	test -L ${HOME}/.local/share/keyrings || rm -rf ${HOME}/.local/share/keyrings
	ln -vsfn ${HOME}/backup/keyrings ${HOME}/.local/share/keyrings
	@echo "${BLUE}Keyring is good to go...${RESET}"
	@sleep 1

localhost: ## Set ssl for localhost
	@echo "${BLUE}Creating certs to localhost...${RESET}"
	@sleep 1
	sudo apt-get install -y build-essential curl file git libnss3-tools
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
	test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
	brew install mkcert nss
	mkcert -install
	mkcert localhost
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## DOCKER
###########################################################################################################
.PHONY: docker docker-compose

docker: ## Docker initial setup
	@echo "${BLUE}Installing 🐳 Docker...${RESET}"
	@sleep 1
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io
	sudo groupadd docker
	sudo usermod -aG docker ${USER}
	mkdir -p ${HOME}/.docker
	ln -vsf ${PWD}/.docker/config.json ${HOME}/.docker/config.json
	@echo "${BLUE}Starting 🐳 Docker...${RESET}"
	@sleep 1
	sudo systemctl enable docker.service
	sudo systemctl enable containerd.service
	@echo "${BLUE}Docker is installed...${RESET}"
	@sleep 1

docker-compose: gcloud ## Set up docker-compose
	@echo "${BLUE}Installing 🐳 Docker-compose...${RESET}"
	@sleep 1
	sudo apt-get install -y docker-compose
	gcloud components install docker-credential-gcr
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## POSTGRES
###########################################################################################################
.PHONY: postgresql pgcli

postgresql: ## PostgreSQL initial setup
	@echo "${BLUE}Installing 🐗 PostgreSQL...${RESET}"
	@sleep 1
	sudo apt-get install -y postgresql
	cd /home;\
	sudo -u postgres initdb -E UTF8 --no-locale -D '/var/lib/postgres/data'
	sudo systemctl start postgresql.service
	cd /home;\
	sudo -u postgres createuser --interactive
	@echo "${BLUE}Finished...${RESET}"
	@sleep 1

pgcli: ## Init pgcli
	@echo "${BLUE}Creating symlinks to 🐗 dotfiles...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.Matrix/.backups
	pip install --user pgcli
	test -L ${HOME}/.config/pgcli || rm -rf ${HOME}/.config/pgcli
	ln -vsfn ${HOME}/backup/pgcli ${HOME}/.config/pgcli
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## GOOGLE CLOUD
###########################################################################################################
.PHONY: gcloud

gcloud: ## Install google cloud SDK and setting
	@echo "${BLUE}Installing ☁️ Google cloud SDK...${RESET}"
	@sleep 1
	curl https://sdk.cloud.google.com | bash
	test -L ${HOME}/.config/gcloud || rm -rf ${HOME}/.config/gcloud
	ln -vsfn ${HOME}/.Matrix/.backups/gcloud   ${HOME}/.config/gcloud
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## GITHUB
###########################################################################################################
.PHONY: github

github: ## Install and setup github-cli
	@echo "${BLUE}Installing 🦊 Github...${RESET}"
	@sleep 1
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
	sudo apt-add-repository https://cli.github.com/packages
	sudo apt update
	sudo apt install gh
	test -L ${HOME}/.config/gh || rm -rf ${HOME}/.config/gh
	ln -vsfn ${HOME}/.Matrix/.backups/gh ${HOME}/.config/gh
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## AWS
###########################################################################################################
.PHONY: aws awsv2

aws: ## Init aws cli
	@echo "${BLUE}Creating local directory...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.local
	@echo "${BLUE}Installing AWS cli...${RESET}"
	@sleep 1
	pip install --user awscli
	ln -vsfn ${PWD}/.aws ${HOME}/.aws
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

awsv2: ## Init aws cli version 2
	@echo "${BLUE}Installing AWS cli v.2...${RESET}"
	@sleep 1
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	test -L ${HOME}/.aws || rm -rf ${HOME}/.aws
	ln -vsfn ${PWD}/.aws ${HOME}/.aws
	rm -fr awscliv2.zip
	rm -rf aws
	pip install --user awslogs
	@echo "${BLUE}Done...${RESET}"
	@sleep 1

###########################################################################################################
## TMUX
###########################################################################################################
.PHONY: tmuxp

tmuxp: ## Install tmuxp
	@echo "${BLUE}Are you tired of installing stuff yet?...${RESET}"
	@sleep 1
	mkdir -p ${HOME}/.local
	pip install --user tmuxp
	sudo ln -vsf ${PWD}/.config/main.yaml ${HOME}/.config/main.yaml
	@echo "${BLUE}Done... Or are we?...${RESET}"
	@sleep 1

###########################################################################################################
## TESTS
###########################################################################################################
.PHONY: test_backup test test_path test_nvm test_colors

test_backup: ## Test this Makefile with mount backup directory
	docker build -t dotfiles ${PWD}
	docker run -it --name maketestbackup -v /home/${USER}/backup:${HOME}/backup:cached --name makefiletest -d dotfiles:latest /bin/bash;\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make install";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make init";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make neomutt";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make aur";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make pipinstall";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make goinstall";\
	docker exec -it maketestbackup sh -c "cd ${PWD}; make nodeinstall"

test: ## Test this Makefile with docker without backup directory
	docker build -t dotfiles ${PWD};\
	docker run -it --name maketest -d dotfiles:latest /bin/bash;\
	docker exec -it maketest sh -c "cd ${PWD}; make install";\
	docker exec -it maketest sh -c "cd ${PWD}; make init";\
	docker exec -it maketest sh -c "cd ${PWD}; make neomutt";\
	docker exec -it maketest sh -c "cd ${PWD}; make aur";\
	docker exec -it maketest sh -c "cd ${PWD}; make pipinstall";\
	docker exec -it maketest sh -c "cd ${PWD}; make goinstall";\
	docker exec -it maketest sh -c "cd ${PWD}; make nodeinstall"

test_path: ## Echo PATH
	PATH=$$PATH
	@echo $$PATH

test_nvm:
	. $(NVM_DIR)/nvm.sh; bats test

test_colors: ## Show the colors available for the Makefile
	@echo "${BLACK}BLACK${RESET}"
	@echo "${RED}RED${RESET}"
	@echo "${GREEN}GREEN${RESET}"
	@echo "${YELLOW}YELLOW${RESET}"
	@echo "${PURPLE}PURPLE${RESET}"
	@echo "${PINK}PINK${RESET}"
	@echo "${BLUE}BLUE${RESET}"
	@echo "${WHITE}WHITE${RESET}"

###########################################################################################################
## SAVE
###########################################################################################################
.PHONY: save_dconf save_vsce

save_dconf: ## Save dconf settings to .config/dconf/settings.dconf
	dconf dump /org/gnome/ > ~/.config/dconf/settings.dconf

save_vsce: ## Save a list of VSC extensions to .config/Code/extensions.txt
	ls .vscode/extensions/ > ~/.config/Code/extensions.txt

save: save_dconf save_vsce ## Update dconf and vsc extensions files





