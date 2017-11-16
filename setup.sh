#!/usr/bin/env bash

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
    echo "source \"$(dirname $0)/.vimrc\"" > ~/.vimrc
fi

echo "Include my gitconfig"
git config --global include.path "$(dirname $0)/.gitconfig"
