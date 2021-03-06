# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#AFAIK this line is not needed because the only way this file will EVER be loaded in a non-interactive shell is if people put /bin/bash -l as the shebang line
#[ -z "$PS1" ] && return

if [ "$TERM" == "screen" ]; then
  export TERM=screen-256color
elif [ "$TERM" == "xterm" ]; then
  export TERM=xterm-256color
fi

shopt -s histverify histreedit histappend
export HISTCONTROL=erasedups
export HISTSIZE="NOTHING"
export HISTFILESIZE="NOTHING"
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s expand_aliases

#shopt -s cdable_vars

shopt -s globstar

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

if hash kubectl 2>/dev/null; then
  source <(kubectl completion bash)
fi

shopt -s autocd

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export OS="osx"
fi

export PATH="$(eval echo "$(paste -d: -s ~/key/config/env_paths)")"
export MANPATH="$(eval echo "$(paste -d: -s ~/key/config/env_manpaths)"):"
export MANPATH="$(manpath 2>/dev/null)"
export WHOME="/mnt/c/Users/Brenton Fletcher"
export USERPROFILE="$WHOME"
export GOPATH="$WHOME/Source/go"

if [[ "$OS" == "linux" ]]; then
  :
elif [[ "$OS" == "osx" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

if [ -f "$HOME/.docker/host" ]; then
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_CERT_PATH="$HOME/.docker/tls"
  export DOCKER_HOST="$(<~/.docker/host)"
fi

export KUBECONFIG="$HOME/.kube/config"

export NPM_CONFIG_PREFIX="${HOME}/.npm-packages"

export CLICOLOR=TRUE

export CAMPING_ENV=development
export RUNNING_LOCALLY=true

export ACK_OPTIONS="-i --type-add ruby=haml"
export VISUAL="vi"

export JRUBY_OPTS="--1.9"

if [ -f ~/work/environment ]; then
  . ~/work/environment
fi

if [ -f ~/.bashrc_private ]; then
  . ~/.bashrc_private
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias sad="psql -h localhost -U postgres "
alias mad="mysql -u root "
alias sslice="ssh -p 9979 bloople@67.207.142.56"
alias lnode="ssh bloople@178.79.147.14"
alias glog="git log --author=brenton -i --pretty=format:'%h %ar%x09* %s' | less"
alias here="xdg-open ."
alias whome="cd \"$WHOME\""

alias astream="vlc --sout '#transcode{acodec=mp3}:duplicate{dst=gather:std{mux=mpeg1,dst=:8080/,access=http},select=\"novideo\"}' --sout-keep --sout-audio"
alias splitpdf="gs -q -sDEVICE=jpeg -dBATCH -dNOPAUSE  -r300 -sOutputFile=%03d.jpg input.pdf;mogrify -limit memory 256MiB -resize 50% -trim -fuzz 5 *.jpg"
alias right="xrandr --current -o right"
alias normal="xrandr --current -o normal"
alias comicify="mogrify -fuzz 50% -trim +repage  -resize 480x -background white -extent 480x800 +repage -colorspace Gray -quality 90 "
alias recent="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias e="atom ."
alias getin="cd $HOME/key/config-vagrant/ && vagrant_ssh_fast"

function r3lar () { echo "" > log/test.log; rspec "$1"; cat log/test.log; }
function ptb () { scp -P 9979 "$1" bloople@bloople.net:~/www/bloople.net/public; echo "http://bloople.net/$1"; }
function ptbh () { scp -P 9979 "$1" bloople@bloople.net:~/www/bloople.net/public/h; echo "http://bloople.net/h/$1"; }

function gems () { cd "$GEM_HOME/gems"; }
function validutf8 () { iconv -f UTF-8 "$1" -o /dev/null; echo "$?"; }

function app () {
  reset
  pkill -9 -f sidekiq
  pkill -9 -f mailcatcher
  pkill -9 -f puma
  bundle exec foreman start
}

if [ -f ~/key/pillage/bash/functions.sh ]; then
  source ~/key/pillage/bash/functions.sh
fi

cd .

function __set_ps1_with_git_branch {
    __git_branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
    [ "$__git_branch" = "master" ] && __git_branch="@"
    test -n "$__git_branch" && __git_branch="\[\033[1;32m\]:\[\033[0m\033[0;32m\]$__git_branch\[\033[0m\]"
    export PS1="\w$__git_branch\[\033[1;37m\]$\[\033[0m\] \[\e]0;bash\007\]"
    return 0
}

#This must be the last command in this file, I'm not completely sure why, but I think it relates to any further lines in this file being used as a $BASH_COMMAND which fails the shell
if [ "$SHELL" = '/bin/bash' -o "$SHELL" = '/usr/local/bin/bash' ]
then
    case $TERM in
      rxvt|*term*|*screen*)
          export PROMPT_COMMAND="__set_ps1_with_git_branch;$PROMPT_COMMAND"
          trap 'echo -ne "\e]2;$BASH_COMMAND\007"' DEBUG
      ;;
    esac
fi

