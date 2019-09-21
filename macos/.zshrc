# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/josephkhawly/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew django git git-extras jira osx vscode web-search yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# powerlevel9k config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon host dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_HOST_LOCAL_BACKGROUND='017'
POWERLEVEL9K_HOST_LOCAL_FOREGROUND='201'
POWERLEVEL9K_OS_ICON_BACKGROUND='017'
POWERLEVEL9K_OS_ICON_FOREGROUND='201'

POWERLEVEL9K_DIR_HOME_FOREGROUND='201'
POWERLEVEL9K_DIR_HOME_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='201'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='017'
POWERLEVEL9K_DIR_ETC_FOREGROUND='201'
POWERLEVEL9K_DIR_ETC_BACKGROUND='017'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='201'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_first_and_last'
POWERLEVEL9K_SHORTEN_DIR_LENGTH='2'

POWERLEVEL9K_VCS_SHORTEN_LENGTH=4
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."

POWERLEVEL9K_STATUS_OK_BACKGROUND='017'

POWERLEVEL9K_CUSTOM_NOW_PLAYING='~/.nowplaying'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_BACKGROUND='017'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_FOREGROUND='201'

export PATH=~/bin:$PATH
export PATH=$PATH:/Users/josephkhawly/Library/Python/3.7/bin
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer
source /usr/local/bin/virtualenvwrapper.sh


if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
eval $(thefuck --alias)

# --- Fun with cowsay ---

# Change the cow's look depending on the nearest holiday
COWCOMMAND="cowsay"
COWFLAGS=""
case $(date +"%b") in
    "Oct") COWFLAGS+="-f skeleton"; ;; # Halloween
    "Nov") COWFLAGS+="-f turkey"; ;; # Thanksgiving
    "Dec") COWFLAGS+="-f snowman"; ;; # Christmas
esac;

if [[ $(date +"%b%d") == "Apr20" ]]; then # 4/20
    COWFLAGS+="-s "
fi

# The cow will look tired between the hours of 10PM and 7AM
# And its words will become thoughts
if [ $(date +%k%M) -gt 2200 -o $(date +%k%M) -lt 700 ]; then
    COWCOMMAND="cowthink"
    COWFLAGS+="-t"
fi

# Make the cow say a fortune and output with rainbow characters
if [ -x /usr/local/bin/fortune ]; then
    fortune -s | $COWCOMMAND $COWFLAGS
fi
