# System Setup

1. Copy ssh private keys etc into `~/.ssh/`
2. `sudo apt-get install build-essential git curl python-pip`
3. `git clone git@github.com:bloopletech/config.git ~/key/config`
4. `cd ~/key/config && ./setup_dotfiles.sh`
5. Open a new shell.
6. Download and install GUI apps:
   * Google Chrome
   * Atom: https://github.com/atom/atom/releases/tag/v1.0.7
   * On Ubuntu:
     * ROXTerm: http://roxterm.sourceforge.net/index.php?page=installation&lang=en
     * Zeal: http://zealdocs.org/
   * On OS X:
     * iTerm2: https://www.iterm2.com/downloads.html
     * Karabiner: https://pqrs.org/osx/karabiner/
     * BetterTouchTool: http://www.bettertouchtool.net/
7. Download and install terminal apps:
   * jq: https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
   * fzf: `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install`
   * fzf-fs: https://github.com/D630/fzf-fs
   * glances: `curl -L http://bit.ly/glances | /bin/bash`
   * youtube-dl: `sudo pip install youtube-dl`

