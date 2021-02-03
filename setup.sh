#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "VimPlug already installed"
else
    echo "Installing VimPlug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -f ~/.vimrc ]; then
    echo ".vimrc already exists. Skipping"
else
    echo "Creating .vimrc"
    echo "source $DIR/.vimrc" > ~/.vimrc
fi

echo "Installing vim plugins"
vim +PlugInstall +qall

echo "Include my gitconfig"
git config --global include.path "$DIR/.gitconfig"

echo "Include my gitignore"
git config --global core.excludesfile "$DIR/.gitignore_global"
