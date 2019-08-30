# editing files
alias mod='code ~/.bashrc'
alias ea='code ~/.bash_aliases'
alias src='source ~/.bash_aliases && echo "sourced"'

# apt-get
alias up='sudo apt update && sudo apt upgrade -y'
alias get='sudo apt install'
alias purge='sudo apt purge'
alias ac='sudo apt autoclean && sudo apt autoremove'
alias addrepo='sudo apt-add-repository'
alias lookfor='apt search'

alias pip='python -m pip'

alias c='clear'

# Update all git repos in a directory
# Found at https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
alias pullall='ls | xargs -P10 -I{} git -C {} pull'

alias sudo='sudo' # lets you use sudo with aliases

# cd'ing
alias dev='cd ~/Developer'
alias ..='cd ..'

# SSH
alias rpi='ssh pi@josephkhawly.com'

# ls
alias ll='ls -alf'
alias la='ls -a'
alias l='ls -ch'
