# System Setup

1. Copy ssh private keys etc into `~/.ssh/`
3. `git clone git@github.com:bloopletech/config.git ~/key/config`
4. `cd ~/key/config && ./setup_dotfiles.sh`
5. Open a new shell
6. Download and install GUI apps:
   * Google Chrome
   * On Ubuntu:
     * ROXTerm: http://roxterm.sourceforge.net/index.php?page=installation&lang=en
     * Zeal: http://zealdocs.org/
7. Download and install terminal apps:
   * jq: https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
   * fzf: `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install`
   * fzf-fs: https://github.com/D630/fzf-fs
   * glances: `curl -L http://bit.ly/glances | /bin/bash`
   * youtube-dl: `sudo pip install youtube-dl`

## Mac-specific Setup

### Prerequisite configuration

Run this configuration before doing the Install GUI Apps setup.

Open a terminal and run:

````
xcode-select --install #Click 'Install' when prompted
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install bash
brew install git
````

### Install GUI Apps

Install the following:
* iTerm2: https://www.iterm2.com/downloads.html
* Karabiner: https://pqrs.org/osx/karabiner/
* BetterTouchTool: http://www.bettertouchtool.net/
* EasySIMBL: https://github.com/norio-nomura/EasySIMBL
* MenuBarHider: https://github.com/Crazor/MenuBarHider/releases
* Atom: https://atom.io/download/mac
* mpv: http://sva.wakku.to/~chris/mpv_builds/mpv_latest.zip

#### BetterTouchTool configuration

1. Open BetterTouchTool
2. Click the BetterTouchTool menu bar icon, and click `Preferences...`
3. If prompted, enable window snapping
4. Click `Advanced` in the top-left of the window
5. Click `Advanced Settings`
6. Check `Launch BetterTouchTool on startup`
7. Click `Gestures`
8. Click `Global`
9. Click `+ Configure New Trigger`
10. Click `Please Select a Gesture`, and select `Leftclick Green Window Button`
11. Click `No Action`, and select `Window Interation` -> `Zoom Window Below Cursor`
12. Close the BetterTouchTool window

#### MenuBarHider configuration

1. Download the zip file from the above url, and extract the zip file
2. Copy the .bundle file to `~/Library/Application Support/SIMBL/Plugins`
3. Open the EasySIMBL application
4. Check `Use SIMBL`
5. Close the EasySIMBL window

### iTerm2 configuration

1. Open iTerm2
2. Open Preferences
3. Click `Profiles`
4. Check `Command:` and enter `/usr/local/bin/bash -l` in the text box
4. In `Send text at start:`, enter `getin`

### mpv / youtube-dl configuration

Open a terminal and run:
````
brew install youtube-dl --with-rtmpdump --HEAD
````

### General configuration

Open a terminal and run:

````
defaults write com.apple.dock autohide -bool TRUE
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.2
defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -int 0
defaults write -globalDomain AppleEdgeResizing NO
killall Dock
````

## Ubuntu-specific Setup

Open a terminal and run:

````
sudo apt-get install bash curl patch bzip2 ca-certificates gawk make libc6-dev openssl libreadline-dev \
  zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses-dev automake \
  libtool bison pkg-config libffi-dev g++ gcc build-essential git python3-pip libxml2-dev libxslt1-dev libpq-dev \
  libmagickcore-dev libmagickwand-dev
````

Install Node.js by folling the instructions at https://github.com/nodesource/distributions#installation-instructions.

## Windows-specific Setup

### Install GUI Apps

Install the following:
* 7-Zip: http://www.7-zip.org/download.html
* Abyss Web Server X1: http://aprelium.com/abyssws/download.php
* Advanced Renamer: https://www.advancedrenamer.com/download
* Equalizer APO: https://sourceforge.net/projects/equalizerapo/
* foobar2000: http://www.foobar2000.org/download
* Free Clipboard Viewer: http://www.freeclipboardviewer.com/
* Free Download Manager: http://www.freedownloadmanager.org/
* HandBrake: https://handbrake.fr/
* Hourglass: http://chris.dziemborowicz.com/apps/hourglass/
* HxD Hex Editor: https://mh-nexus.de/en/hxd/
* IrfanView: http://www.irfanview.com/
* mpv: https://mpv.srsfckn.biz/
* Notepad++: https://notepad-plus-plus.org/
* paint.net: http://www.getpaint.net/index.html
* SyncTrazor: https://github.com/canton7/SyncTrayzor#installation
* Transmission-Qt: http://trqtw.sourceforge.net/blog/
* VcXsrv: https://sourceforge.net/projects/vcxsrv/
* WebP Codex for Windows: https://developers.google.com/speed/webp/docs/webp_codec
* WinDirStat: https://windirstat.info/download.html

## Google Chrome Extensions

* Always Clear Downloads: https://chrome.google.com/webstore/detail/always-clear-downloads/cpbmgiffkljiglnpdbljhlenaikojapc
* Atomic Chrome: https://chrome.google.com/webstore/detail/atomic-chrome/lhaoghhllmiaaagaffababmkdllgfcmc
* Double-click Image Downloader: https://chrome.google.com/webstore/detail/double-click-image-downlo/bkijmpolkanhdehnlnabfooghjdokakc
* Full Window Image Viewer: https://chrome.google.com/webstore/detail/full-window-image-viewer/poakplgknboogmjglihkhdgpljkmajel
* img2tab: https://chrome.google.com/webstore/detail/img2tab/kbbalffcbdlngpklndognfpcipmhdmod
* LastPass: Free Password Manager: https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd
* LiveReload: https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
* No Scroll Bars Please!
* Reddit Enhancement Suite: https://chrome.google.com/webstore/detail/reddit-enhancement-suite/kbmfpngjjgdllneeigpgjifpgocmfgmb
* select-copy: https://chrome.google.com/webstore/detail/select-copy/obeogbddablmkbhgbgkfigpfldpofilb
* story-leanback: https://chrome.google.com/webstore/detail/story-leanback/ooghbbjkiphcimhhcfjglgippbiageai
* Stylist: https://chrome.google.com/webstore/detail/stylist/pabfempgigicdjjlccdgnbmeggkbjdhd
* Tabby Cat: https://chrome.google.com/webstore/detail/tabby-cat/mefhakmgclhhfbdadeojlkbllmecialg
* uBlock Origin: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
