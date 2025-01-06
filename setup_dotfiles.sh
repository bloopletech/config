#!/bin/bash
cd ~
rm .agignore
ln -nfs ~/key/config/home/.agignore
rm .pulsar/config.cson
ln -nfs ~/key/config/home/.atom/config.cson .pulsar/config.cson
rm .pulsar/keymap.cson
ln -nfs ~/key/config/home/.atom/keymap.cson .pulsar/keymap.cson
rm .pulsar/packages.cson
ln -nfs ~/key/config/home/.atom/packages.cson .pulsar/packages.cson
rm .pulsar/styles.less
ln -nfs ~/key/config/home/.atom/styles.less .pulsar/styles.less
rm -r .pulsar/packages/fuzzy-finder
mkdir -p .pulsar/packages
ln -nfs ~/key/config/home/.atom/packages/fuzzy-finder .pulsar/packages/fuzzy-finder
rm .bash_profile
ln -nfs ~/key/config/home/.bash_profile
rm .bashrc
ln -nfs ~/key/config/home/.bashrc
rm .gemrc
ln -nfs ~/key/config/home/.gemrc
rm .gvimrc
ln -nfs ~/key/config/home/.gvimrc
rm .inputrc
ln -nfs ~/key/config/home/.inputrc
rm -r .mplayer
ln -nfs ~/key/config/home/.mplayer
rm .netrc
ln -nfs ~/key/config/home/.netrc
rm .psqlrc
ln -nfs ~/key/config/home/.psqlrc
rm -r .vim
ln -nfs ~/key/config/home/.vim
rm .vimrc
ln -nfs ~/key/config/home/.vimrc
rm -r .wmii-hg
ln -nfs ~/key/config/home/.wmii-hg
rm .xprofile
ln -nfs ~/key/config/home/.xprofile
rm .Xresources
ln -nfs ~/key/config/home/.Xresources
rm .tmux.conf
ln -nfs ~/key/config/home/.tmux.conf
rm -r .i3
ln -nfs ~/key/config/home/.i3
rm .indicator-sysmonitor.json
ln -nfs ~/key/config/home/.indicator-sysmonitor.json
rm -r .config/mpv
ln -nfs ~/key/config/home/.config/mpv .config/mpv
rm -r .config/roxterm.sourceforge.net
ln -nfs ~/key/config/home/.config/roxterm.sourceforge.net .config/roxterm.sourceforge.net
rm -r .config/youtube-dl
ln -nfs ~/key/config/home/.config/youtube-dl .config/youtube-dl
rm -r .config/yt-dlp
ln -nfs ~/key/config/home/.config/yt-dlp .config/yt-dlp
rm .local/share/applications/mimeapps.list
ln -nfs ~/key/config/home/.local/share/applications/mimeapps.list .local/share/applications/mimeapps.list
rm .local/share/applications/play.desktop
ln -nfs ~/key/config/home/.local/share/applications/play.desktop .local/share/applications/play.desktop
rm ~/Library/Preferences/org.pqrs.Karabiner.plist
ln -nfs ~/key/config/home/Library/Preferences/org.pqrs.Karabiner.plist Library/Preferences/org.pqrs.Karabiner.plist
rm ~/Library/Preferences/com.googlecode.iterm2.plist
ln -nfs ~/key/config/home/Library/Preferences/com.googlecode.iterm2.plist Library/Preferences/com.googlecode.iterm2.plist
