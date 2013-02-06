#!/bin/bash
cd ~
rm -i .agignore
ln -nfs ~/key/config/dotfiles/.agignore
rm -i .bash_profile
ln -nfs ~/key/config/dotfiles/.bash_profile
rm -i .bashrc
ln -nfs ~/key/config/dotfiles/.bashrc
rm -i .gvimrc
ln -nfs ~/key/config/dotfiles/.gvimrc
rm -i -r .mplayer
ln -nfs ~/key/config/dotfiles/.mplayer
rm -i -r .vim
ln -nfs ~/key/config/dotfiles/.vim
rm -i .vimrc
ln -nfs ~/key/config/dotfiles/.vimrc
rm -i -r .wmii-hg
ln -nfs ~/key/config/dotfiles/.wmii-hg
rm -i .xprofile
ln -nfs ~/key/config/dotfiles/.xprofile
rm -i .Xresources
ln -nfs ~/key/config/dotfiles/.Xresources
rm -i .tmux.conf
ln -nfs ~/key/config/dotfiles/.tmux.conf
rm -i -r .i3
ln -nfs ~/key/config/dotfiles/.i3

