export PATH=~/bin:$PATH
export PATH=$PATH:/Users/josephkhawly/Library/Python/3.7/bin
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer
source /usr/local/bin/virtualenvwrapper.sh

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

source ~/.git-prompt.sh

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

if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
if [ -x /usr/local/bin/fortune ]; then
    fortune -s | cowsay $COWFLAGS | lolcat
fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

