# editing files
alias mod='code ~/.bash_profile'
alias ea='code ~/.bash_aliases'
alias src='source ~/.bash_aliases && echo "sourced"'

alias lookfor='brew search'
alias up='brew update && brew cask upgrade'

alias pip='python3 -m pip'

alias c='clear'

# Update all git repos in a directory
# Found at https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
alias pullall='ls | xargs -P10 -I{} git -C {} pull'

alias sudo='sudo' # lets you use sudo with aliases

# cd'ing
alias dev='cd ~/Developer'
alias ..='cd ..'
alias cotidie='cd ~/Developer/work/cotidie-theme && code .'
alias trop='cd ~/Developer/work/tropicales && code .'

# SSH
alias rpi='ssh pi@josephkhawly.com'

# ls
alias ll='ls -alf'
alias la='ls -a'
alias l='ls -ch'