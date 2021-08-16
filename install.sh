#!/bin/bash
#
# WSL setup script

source ./scripts/utils.sh
keep_sudo_alive

# -------------------- UPDATE SYSTEM --------------------- #
# Runs apt update and apt upgrade

echo "Checking for updates..."
sudo apt -qq update 
echo "Installing upgrades..."
sudo apt upgrade
echo "✔ System is up to date!"

# --------------------- INSTALL GIT ---------------------- #
# Installs git, pulls any changes to the repository, and symlinks ~/.bashrc

echo "Installing Git..."
sudo apt -qq install git
echo "✔ Git installed!"
echo "Checking dotfile repository status..."
git pull
echo "✔ dotfiles are up to date!"
echo "Updating your ~/.bashrc..."
ln -sf ${DOTFILES_DIRECTORY}/dotfiles/bashrc ~/.bashrc
echo "✔ Done!"

# --------------------- INSTALL APPS --------------------- #
# Installs apps from a predetermined list, /scripts/apps.sh. Make sure to make
# any desired changes to the list before running the script.

seek_confirmation "!!Warning!!: This step modifies your system by installing applications."
if is_confirmed; then
  e_header "Did you make sure the application list was correct?:"
  nano ${DOTFILES_DIRECTORY}/scripts/apps.sh
  bash ./scripts/apps.sh
else
  e_warning "Don't worry, we can skip this and come back to it later."
fi

# ------------------- INSTALL DOTFILES ------------------- #
# Creates symlinks from the /dotfiles directory to the $HOME folder. This will
# overwrite any existing dotfiles, so be sure to back them up if you've made
# changes you don't want to lose.

seek_confirmation "!!Warning!!: If you've made any changes to your current dotfiles, you may want to back them up, since they'll be overwritten."
if is_confirmed; then
  bash ./script/dotfiles.sh
else
  e_warning "You can install your dotfiles later."
fi

# ---------------------- INSTALL NPM --------------------- #
# This will install Node and NPM, and install a predetermined list of NPM
# packages globally. Make sure to make any changes to the list beforehand.

seek_confirmation "!!Warning!!: Installing NPM packages globally..."
if is_confirmed; then
  e_header "Did you make sure they're the correct ones?:"
  nano ${DOTFILES_DIRECTORY}/scripts/npm.sh
  bash ./scripts/npm.sh
else
  e_warning "Skipped npm settings update."
fi

# --------------------- CONFIGURE SSH -------------------- #
# Creates a SSH key

seek_confirmation "!!Warning!!: This step generates SSH keys and config"
if is_confirmed; then
  ask "Please provide an email address: " && printf "\n"
  ssh-keygen -t rsa -b 4096 -C "$REPLY"
  e_success "Generated SSH key."
  e_warning "After finishing the installation, use copyssh command to copy the SSH key to the clipboard."
else
  e_warning "Skipped SSH settings."
fi

# -------------------- CREATE WORKSPACE ------------------ #
# Creates the directories I use for Dev purposes

e_header "Creating your Dev directories"
mkdir ${HOME}/Dev
mkdir ${HOME}/Grimmstar
mkdir ${HOME}/Projects
e_header "Removing old Windows mnts and recreating them..."
rm -f ~/c
ln -sf /mnt/c ~/c
rm -f ~/projects
ln -sf /mnt/c/Projects ~/Projects
ln -sf /mnt/c/Dev ~/Dev
ln -sf /mnt/c/Grimmstar ~/Grimmstar
rm -f ~/downloads
ln -sf /mnt/c/Users/xxcyx/Downloads ~/downloads
rm -f ~/pictures
ln -sf /mnt/c/Users/xxcyx/Pictures ~/pictures
echo "✔ Aliases for windows folders updated"
mkdir -p ${HOME}/.scripts
cp ${DOTFILES_DIRECTORY}/scripts/* ${HOME}/.scripts/
e_success "✔ Finished!"

# --------------------- CLEANUP FILES -------------------- #
# Removes cached downloads, as well as the installation zip and files

e_header "Removing unnecessary files"
sudo apt -y autoremove
rm -rf ${HOME}/.Matrix.tar.gz
rm -rf ${HOME}/.Matrix.zip

e_success "Reboot and enjoy!"