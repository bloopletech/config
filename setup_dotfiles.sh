#!/bin/bash
cd ~
rm -i .agignore
ln -nfs ~/key/config/dotfiles/.agignore
rm -i .atom/config.cson
ln -nfs ~/key/config/dotfiles/.atom/config.cson .atom/config.cson
rm -i .atom/keymaps.cson
ln -nfs ~/key/config/dotfiles/.atom/keymaps.cson .atom/keymaps.cson
rm -i .atom/packages.cson
ln -nfs ~/key/config/dotfiles/.atom/packages.cson .atom/packages.cson
rm -i .atom/styles.less
ln -nfs ~/key/config/dotfiles/.atom/styles.less .atom/styles.less
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
rm -i .indicator-sysmonitor.json
ln -nfs ~/key/config/dotfiles/.indicator-sysmonitor.json
rm -i -r .config/roxterm.sourceforge.net
ln -nfs ~/key/config/dotfiles/.config/roxterm.sourceforge.net .config/roxterm.sourceforge.net
rm -i -r .local/share/applications/mimeapps.list
ln -nfs ~/key/config/dotfiles/.local/share/applications/mimeapps.list .local/share/applications/mimeapps.list
rm -i -r .local/share/applications/play.desktop
ln -nfs ~/key/config/dotfiles/.local/share/applications/play.desktop .local/share/applications/play.desktop
