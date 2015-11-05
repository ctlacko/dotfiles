#!/bin/bash

# set vimrc location
echo "runtime .vimrc" > ~/.vimrc

# download vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
