#!/bin/sh

# This should be run via curl
#
# or just download, navigate to the directory and do:
#   sh install.sh
#

# move the .zshrc and ~/.config/zsh-personal directory to ~/old-zsh directory
mkdir ~/old-zsh

mv ~/.zshrc ~/old-zsh/.zshrc
mv ~/.zshenv ~/old-zsh/.zshenv
mv ~/.zsh_history ~/old-zsh/.zsh_history
mv ~/.zsh-update ~/old-zsh/.zsh-update

mkdir ~/.config/fended
cd ~/.config/fended

git clone git@github.com:mvargasmoran/zsh-personal.git .
cd ~/.config/fended

ln -s  ~/.config/fended/.zshrc ~/.zshrc
ln -s ~/.config/fended/.zshenv ~/.zshenv

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
