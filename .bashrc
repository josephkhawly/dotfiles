# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export GOPATH=~/Developer/golang
# export PATH=/home/joseph/bin:/home/joseph/bin:/home/joseph/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/devkitpro/devkitARM/bin
export DEVKITPRO=/usr/local/devkitpro
export DEVKITARM=/usr/local/devkitpro/devkitARM
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

eval $(thefuck --alias) # because I'm using this: github.com/nvbn/thefuck

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

white="\e[38;5;15m"
lightgreen="\e[38;5;155m"
darkgreen="\e[38;5;48m"
blue="\e[38;5;27m"
if [ "$color_prompt" = yes ]; then
    # prompt displays as [hostname ~:branch]%
    PS1="\[${white}\]["
    PS1+="\[${lightgreen}\]\h " # hostname
    PS1+="\[${darkgreen}\]\w" # working directory
    PS1+="\$(__git_ps1 '\[${blue}\] >%s')" # current branch (if it's a git repo)
    PS1+="\[${white}\]]% "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and grep and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/bin/sensible.bash ]; then
   source ~/bin/sensible.bash
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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- Fun with cowsay ---

# Change the cow's look depending on the nearest holiday
COWFLAGS=""
case $(date +"%b") in
    "Oct") COWFLAGS+="-f skeleton"; ;; # Halloween
    "Nov") COWFLAGS+="-f turkey"; ;; # Thanksgiving
    "Dec") COWFLAGS+="-f snowman"; ;; # Christmas
esac;

if [ $(date +"%b%d") == "Apr20" ]; then # 4/20
    COWFLAGS+="-s"
fi

# The cow will look tired between the hours of 10PM and 7AM
if [ $(date +%k%M) -gt 2200 -o $(date +%k%M) -lt 700 ]; then
    COWFLAGS+=" -t"
fi

# Make the cow say a fortune and output with rainbow characters
if [ -x /usr/games/fortune ]; then
    fortune -s | cowsay $COWFLAGS | lolcat
fi
