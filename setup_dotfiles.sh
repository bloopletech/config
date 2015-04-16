#!/bin/bash
cd ~
rm .agignore
ln -nfs ~/key/config/dotfiles/.agignore
rm .atom/config.cson
ln -nfs ~/key/config/dotfiles/.atom/config.cson .atom/config.cson
rm .atom/keymap.cson
ln -nfs ~/key/config/dotfiles/.atom/keymap.cson .atom/keymap.cson
rm .atom/packages.cson
ln -nfs ~/key/config/dotfiles/.atom/packages.cson .atom/packages.cson
rm .atom/styles.less
ln -nfs ~/key/config/dotfiles/.atom/styles.less .atom/styles.less
rm -r .atom/packages/fuzzy-finder
mkdir -p .atom/packages
ln -nfs ~/key/config/dotfiles/.atom/packages/fuzzy-finder .atom/packages/fuzzy-finder
rm .bash_profile
ln -nfs ~/key/config/dotfiles/.bash_profile
rm .bashrc
ln -nfs ~/key/config/dotfiles/.bashrc
rm .gemrc
ln -nfs ~/key/config/dotfiles/.gemrc
rm .gvimrc
ln -nfs ~/key/config/dotfiles/.gvimrc
rm -r .mplayer
ln -nfs ~/key/config/dotfiles/.mplayer
rm .psqlrc
ln -nfs ~/key/config/dotfiles/.psqlrc
rm -r .vim
ln -nfs ~/key/config/dotfiles/.vim
rm .vimrc
ln -nfs ~/key/config/dotfiles/.vimrc
rm -r .wmii-hg
ln -nfs ~/key/config/dotfiles/.wmii-hg
rm .xprofile
ln -nfs ~/key/config/dotfiles/.xprofile
rm .Xresources
ln -nfs ~/key/config/dotfiles/.Xresources
rm .tmux.conf
ln -nfs ~/key/config/dotfiles/.tmux.conf
rm -r .i3
ln -nfs ~/key/config/dotfiles/.i3
rm .indicator-sysmonitor.json
ln -nfs ~/key/config/dotfiles/.indicator-sysmonitor.json
rm -r .config/roxterm.sourceforge.net
ln -nfs ~/key/config/dotfiles/.config/roxterm.sourceforge.net .config/roxterm.sourceforge.net
rm .local/share/applications/mimeapps.list
ln -nfs ~/key/config/dotfiles/.local/share/applications/mimeapps.list .local/share/applications/mimeapps.list
rm .local/share/applications/play.desktop
ln -nfs ~/key/config/dotfiles/.local/share/applications/play.desktop .local/share/applications/play.desktop
