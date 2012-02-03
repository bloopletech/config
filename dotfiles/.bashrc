# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#AFAIK this line is not needed because the only way this file will EVER be loaded in a non-interactive shell is if people put /bin/bash -l as the shebang line
#[ -z "$PS1" ] && return

# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi





shopt -s autocd

export PATH="/home/bloopletech/key/config/exec:/home/bloopletech/key/apache-ant-1.8.2/bin:/home/bloopletech/key/jdk1.7.0_02/bin:/home/bloopletech/.npm/bin:~/key/exec:~/key/exec/git-svn-clone-externals:/opt/google/chrome/:$PATH"
export MANPATH="/home/bloopletech/.npm/man:$MANPATH"
export JAVA_HOME="/home/bloopletech/key/jdk1.7.0_02/"
export ANT_HOME="/home/bloopletech/key/apache-ant-1.8.2/" #EWWWW

#alias rp="mate app config doc lib db public spec factories features features_integration test vendor/plugins vendor/gems vendor/generators vendor/blueprint &"]
alias sad="psql -h localhost -U postgres "
alias mad="mysql -u root "
alias sslice="ssh -p 9979 bloople@67.207.142.56"
alias lnode="ssh bloople@178.79.147.14"
alias fixnet="sudo modprobe -r ath9k && sudo modprobe ath9k"
alias specs="bundle exec rspec spec/{api,capybara,controllers,coupa_lib,helpers,lib,mailers,models,requests,selenium,views}/**"
#alias allspecs="spec spec/{controllers,models,views,helpers,coupa_lib}/**"
#alias r3allspecs="rspec spec/{controllers,models,views,helpers,coupa_lib}/**"
alias cuke="cucumber -r features "
alias glog="git log --author=brenton -i --pretty=format:'%h %ar%x09* %s' | less"
alias up="git stash && git svn rebase && git stash apply"
alias r="ps -A -f | grep "
alias here="gnome-open ."
#alias nup="sudo ifconfig wlan0 up"
alias suck="wget -r -k -p -np "
alias tubes="aria2c -s 1 -j 4 -i "
alias cutout="git format-patch -1 "
alias gapi="curl -g -i -H 'Accept: application/xml' "
alias lopen="gnome-open $(ls --sort=time -1 | head -1)"

alias vpn="sudo openvpn --config ~/Documents/seattle.ovpn --redirect-gateway def1 bypass-dns bypass-dhcp --daemon; sleep 30; sudo ifconfig tun0 mtu 1300; sudo ifconfig eth0 mtu 1300"
alias astream="vlc --sout '#transcode{acodec=mp3}:duplicate{dst=gather:std{mux=mpeg1,dst=:8080/,access=http},select=\"novideo\"}' --sout-keep --sout-audio"
alias splitpdf="gs -q -sDEVICE=jpeg -dBATCH -dNOPAUSE  -r300 -sOutputFile=%03d.jpg input.pdf;mogrify -limit memory 256MiB -resize 50% -trim -fuzz 5 *.jpg"

function exaudio () { ffmpeg -i "$1" -acodec copy "$1.mp3"; }
function crush () { TMP_FILENAME="/tmp/png_crush_image_$RANDOM"; echo $TMP_FILENAME; pngcrush -rem cHRM -rem gAMA -rem iCCP -rem sRGB "$1" $TMP_FILENAME; mv $TMP_FILENAME "$1"; }
function log_and_run () { echo "" > log/test.log; spec "$1"; cat log/test.log; }
function r3lar () { echo "" > log/test.log; rspec "$1"; cat log/test.log; }
function ptb () { scp -P 9979 "$1" bloople@bloople.net:~/www/bloople.net/public; echo "http://bloople.net/$1"; }
function __e ()
{
  if [[ "$1" == "" ]] || [[ "$1" == "." ]]; then
    start_redcar "$PWD";
  else
    start_redcar "$1";
  fi
}

alias e2="e"

#alias vi="e"
#alias vim="e"

alias ack="ack-grep"

function gems () { cd "$GEM_HOME/gems"; }
function fm () { e $(ack -1 -Q -l --type=ruby "def $1"); }
function validutf8 () { iconv -f UTF-8 "$1" -o /dev/null; echo "$?"; }

function pull ()
{
  git fetch --all
  for branch in "$@"; do
    git checkout "$branch"      || exit 1
    git pull || exit 1
  done
}
alias push="git push"

alias storytime="setsid _storytime"
alias worktime="setsid _worktime"

export CLICOLOR=TRUE

export CAMPING_ENV=development
export RUBYOPT="-rubygems -Ku"
export RUNNING_LOCALLY=true

export ACK_OPTIONS="-i --type-add ruby=haml"
export VISUAL="vi"

export JRUBY_OPTS="--1.9"

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi  
rvm use 1.9.3 >/dev/null

cd .

function __set_ps1_with_git_branch {
    __git_branch="$(git branch 2>/dev/null | sed -e "/^\s/d" -e "s/^\*\s//")"
    [ "$__git_branch" = "master" ] && __git_branch="▲"
    test -n "$__git_branch" && __git_branch="\[\033[1;32m\]:\[\033[0m\033[0;32m\]$__git_branch\[\033[0m\]"
    export PS1="\w$__git_branch\[\033[1;37m\]$\[\033[0m\] \[\e]0;T: bash\007\]"    
    return 0
}

#This must be the last command in this file, I'm not completely sure why, but I think it relates to any further lines in this file being used as a $BASH_COMMAND which fails the shell
if [ "$SHELL" = '/bin/bash' ]
then
    case $TERM in
      rxvt|*term)        
          export PROMPT_COMMAND="__set_ps1_with_git_branch"
          trap 'echo -ne "\e]2;T: $BASH_COMMAND\007"' DEBUG
      ;;
    esac
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
