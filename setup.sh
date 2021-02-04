#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Ensure that file $1 contains line $2
# Creates file/appends line as necessary
function ensure_line {
  grep -qxFs "$2" "$1" || echo "$2" >> "$1"
}

# Vim

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "VimPlug already installed"
else
    echo "Installing VimPlug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Include my .vimrc"
ensure_line ~/.vimrc "source $DIR/.vimrc"

echo "Installing vim plugins"
vim +PlugInstall +qall

# Git

echo "Include my gitconfig"
git config --global include.path "$DIR/.gitconfig"

echo "Include my gitignore"
git config --global core.excludesfile "$DIR/.gitignore_global"
