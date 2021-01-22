SHELL := /bin/bash
DOTFILES_DIR := ~/.cys_dotfiles
PATH := $(DOTFILES_DIR)/bin:$$HOME/.local:$(HOME)/.local/bin:${HOME}/.node_modules/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:${HOME}/bin:${HOME}/google-cloud-sdk/bin:$(PATH)
NVM_DIR := $(HOME)/.nvm

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

update_linux: ## Run apt update + upgrade + autoremove
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -f
	sudo apt autoremove -y

base: ## Installs base packages
	sudo apt-get install -y autoconf automake bash core-utils curl \
	exfat-utils file findutils gettext git git-all git-core grep iputils iproute2 licenses \
	libtool make openvpn openssh-server openssl pkgconf postgresql-client-common \
	postgresql postgresql-contrib postgresql-client python python3.8 python3-pip \
	python-openssl sed screen systemd systemd-sysvcompat tmux tar ubuntu-wsl util-linux vim \
	wget which yarn

dev: ## Installs dev packages
	sudo apt-get install -y apache2 autoconf automake awscli build-essential direnv g++ gcc \
	git-secrets keychain debootstrap oath-toolkit imagemagick llvm python3-venv tk pkgfile \
	dconf-editor rsync nodejs npm xz-utils shellcheck bash-completion python-prompt_toolkit sshfs \
	syncthing editorconfig-core-c man-db mkcert

libs: ## Installs library packages
	sudo apt-get install -y libapache2-mod-wsgi libbz2-dev libexpat1-dev libffi-dev libgdbm-dev liblzma-dev libmysqlclient-dev \
	libncurses5-dev libncursesw5-dev libpq-dev libpython2-dev libpython3-dev libreadline-dev \
	libsqlite3-dev libssl-dev zlib1g-dev tcl-dev tk-dev gcc-libs

security: ## Installs security related packages
	sudo apt-get install -y apt-transport-https ca-certificates linux-headers-generic \
	software-properties-common

fun: ## Installs unnecessary things for my amusement
	sudo apt-get install -y figlet fonts-powerline lolcat

pip: ## Installs the Python packages I use for basically everything
	mkdir -p ${HOME}/.local
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python ${PWD}/get-pip.py --user
	pip install --user --upgrade pip
	pip install --user ansible
	pip install --user ansible-lint
	pip install --user autopep8
	pip install --user black
	pip install --user cheat
	pip install --user chromedriver-binary
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
	pip install --user jupyter
	pip install --user jupyterlab
	pip install --user jupyterthemes
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
	pip install --user selenium
	pip install --user speedtest-cli
	pip install --user streamlink
	pip install --user tldr
	pip install --user trash-cli
	pip install --user truffleHog
	pip install --user virtualenv
	pip install --user virtualenvwrapper
	pip install --user yapf
	rm -fr get-pip.py

npm: ## Actually installs NVM
	if ! [ -d $(NVM_DIR)/.git ]; then git clone https://github.com/creationix/nvm.git $(NVM_DIR); fi
	. $(NVM_DIR)/nvm.sh; nvm install --lts

packages: npm ## Installs NVM, if necessary, then installs packages
	. $(NVM_DIR)/nvm.sh; npm install -g $(shell cat install/npmfile)

node: ## Install node packages
	sudo apt-get -S yarn
	mkdir -p ${HOME}/.node_modules
	yarn global add babel-eslint
	yarn global add bash-language-server
	yarn global add cloc
	yarn global add create-component-app
	yarn global add dockerfile-language-server-nodejs
	yarn global add esbuild-linux-64
	yarn global add eslint
	yarn global add eslint-cli
	yarn global add expo-cli
	yarn global add firebase-tools
	yarn global add fx
	yarn global add gulp
	yarn global add	gulp-cli
	yarn global add heroku
	yarn global add indium
	yarn global add intelephense
	yarn global add javascript-typescript-langserver
	yarn global add jshint
	yarn global add logo.svg
	yarn global add @marp-team/marp-cli
	yarn global add mermaid
	yarn global add mermaid.cli
	yarn global add netlify-cli
	yarn global add ngrok
	yarn global add now
	yarn global add prettier
	yarn global add parcel-bundler
	yarn global add typescript-language-server
	yarn global add webpack
	
ssh: ## Init ssh
	mkdir -p ${HOME}/.ssh
	ln -vsf ${PWD}/.ssh/config ${HOME}/.ssh/config
	ln -vsf ${PWD}/.ssh/known_hosts ${HOME}/.ssh/known_hosts
	chmod 600 ${HOME}/.ssh/id_rsa

keyring: ## Init gnome keyrings
	sudo apt-get install -y seahorse
	mkdir -p ${HOME}/.local/share
	test -L ${HOME}/.local/share/keyrings || rm -rf ${HOME}/.local/share/keyrings
	ln -vsfn ${HOME}/backup/keyrings ${HOME}/.local/share/keyrings

localhost: # Set ssl for localhost
	mkcert -install
	mkcert localhost	

docker: ## Docker initial setup
	sudo apt-get install -y docker
	sudo usermod -aG docker ${USER}
	mkdir -p ${HOME}/.docker
	ln -vsf ${PWD}/.docker/config.json ${HOME}/.docker/config.json
	sudo systemctl enable docker.service
	sudo systemctl start docker.service

postgresql: ## PostgreSQL initial setup
	sudo apt-get install -y postgresql
	cd /home;\
	sudo -u postgres initdb -E UTF8 --no-locale -D '/var/lib/postgres/data'
	sudo systemctl start postgresql.service
	cd /home;\
	sudo -u postgres createuser --interactive

pgcli: ## Init pgcli
	mkdir -p ${HOME}/backup
	pip install --user pgcli
	test -L ${HOME}/.config/pgcli || rm -rf ${HOME}/.config/pgcli
	ln -vsfn ${HOME}/backup/pgcli ${HOME}/.config/pgcli

gcloud: ## Install google cloud SDK and setting
	sudo apt-get install -y kubectl kubectx kustomize helm
	curl https://sdk.cloud.google.com | bash
	test -L ${HOME}/.config/gcloud || rm -rf ${HOME}/.config/gcloud
	ln -vsfn ${HOME}/backup/gcloud   ${HOME}/.config/gcloud

docker-compose: ## Set up docker-compose
	sudo apt-get install -y docker-compose
	gcloud components install docker-credential-gcr

github: ## Install and setup github-cli
	sudo apt-get install -y github-cli
	test -L ${HOME}/.config/gh || rm -rf ${HOME}/.config/gh
	ln -vsfn ${HOME}/backup/gh ${HOME}/.config/gh

aws: ## Init aws cli
	mkdir -p ${HOME}/.local
	pip install --user awscli
	ln -vsfn ${PWD}/.aws ${HOME}/.aws

awsv2: ## Init aws cli version 2
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	test -L ${HOME}/.aws || rm -rf ${HOME}/.aws
	ln -vsfn ${PWD}/.aws ${HOME}/.aws
	rm -fr awscliv2.zip
	rm -rf aws
	pip install --user awslogs

tmuxp: ## Install tmuxp
	mkdir -p ${HOME}/.local
	pip install --user tmuxp
	sudo ln -vsf ${PWD}/.config/main.yaml ${HOME}/.config/main.yaml

django: ## Install Django
	mkdir -p ${HOME}/src_code/github.com/grimm-child/Django;\
	cd ${HOME}/src_code/github.com/grimm-child/Django;\
	touch Pipfile;\
	pipenv --python=3.8.6;\
	pipenv install django;\
	pipenv run django-admin startproject config .

pipbackup: ## Backup Python packages
	mkdir -p ${PWD}/cybuntu
	pip freeze > ${PWD}/cybuntu/requirements.txt

piprecover: ## Recover python packages
	mkdir -p ${PWD}/cybuntu
	pip install --user -r ${PWD}/cybuntu/requirements.txt

pipupdate: ## Update python packages
	pip list --user | cut -d" " -f 1 | tail -n +3 | xargs pip install -U --user

testbackup: ## Test this Makefile with mount backup directory
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

testpath: ## Echo PATH
	PATH=$$PATH
	@echo $$PATH

test_nvm:
	. $(NVM_DIR)/nvm.sh; bats test

save-dconf: ## Save dconf settings to .config/dconf/settings.dconf
	dconf dump /org/gnome/ > ~/.config/dconf/settings.dconf

save-vsce: ## Save a list of VSC extensions to .config/Code/extensions.txt
	ls .vscode/extensions/ > ~/.config/Code/extensions.txt

save: save-dconf save-vsce ## Update dconf and vsc extensions files





