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
killall Dock
````

## Ubuntu-specific Setup

Open a terminal and run:

````
sudo apt-get install bash curl patch bzip2 ca-certificates gawk make libc6-dev openssl libreadline6 libreadline6-dev \
  zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake \
  libtool bison pkg-config libffi-dev g++ gcc build-essential git python-pip libxml2-dev libxslt1-dev libpq-dev
````

Install Node.js by folling the instructions at https://github.com/nodesource/distributions#installation-instructions.
