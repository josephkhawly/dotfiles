# editing files
# replace 'atom' with whatever text editor you prefer.
alias mod='atom ~/.bashrc'
alias ea='atom ~/.bash_aliases'
alias src='source ~/.bash_aliases && echo "sourced"'

# apt-get
alias up='sudo apt-get update && sudo apt-get upgrade'
alias get='sudo apt-get install'
alias purge='sudo apt-get purge'
alias ac='sudo apt-get autoclean && sudo apt-get autoremove'
alias addrepo='sudo apt-add-repository'
alias lookfor='apt-cache search'

# SSH
alias purdue='ssh jkhawly@data.cs.purdue.edu'
alias pi='ssh pi@josephkhawly.com'

# ls
alias ll='ls -alf'
alias la='ls -a'
alias l='ls -ch'
