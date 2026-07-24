#!/usr/bin/env bash

source setup_utils.sh

# Bash

echo "Include my .bashrc"
ensure_line ~/.bashrc "source $DIR/.bashrc"

echo "Include my .profile"
ensure_profile .profile

# Vim

echo "Installing VimPlug"
download_file ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Include my .vimrc"
ensure_line ~/.vimrc "source $DIR/.vimrc"

echo "Installing vim plugins"
vim +PlugInstall +qall

# Git

echo "Include my gitconfig"
git config --global include.path "$DIR/.gitconfig"

echo "Include my gitignore"
git config --global core.excludesfile "$DIR/.gitignore_global"

# Pass

echo "Include my pass profile"
ensure_profile pass_config/.profile

echo "Installing pass-code extension"
download_file ~/.password-store/.extensions/code.bash https://raw.githubusercontent.com/alpernebbi/pass-code/master/code.bash
chmod u+x ~/.password-store/.extensions/code.bash

# Intellij

## IdeaVim plugin

echo "Include my .vimrc in Intellij IdeaVim"
ensure_line ~/.ideavimrc "source $DIR/.vimrc"

# Python

echo "Default Python to Python 3"
sudo apt-get install python-is-python3

# Utils

echo "Install dos2unix"
sudo apt-get install dos2unix
