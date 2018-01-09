# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

# Navigation
alias dg='cd ~/Dev/git'
alias dv='cd ~/Dev'
alias dvg='cd ~/Dev/go'
alias dvp='cd ~/Dev/personal'
alias dvm='cd ~/Dev/mlc'

#Docker
alias dk='docker'
alias dkr='docker run'
alias dkrdev='docker run -v /Users/visualdensity/Dev:/root/dev'
alias dkv='docker volume ls'
alias dkps='docker ps -a'
alias dkrm='docker ps -a --format "{{.ID}}" | xargs docker rm -v'
alias dcm='docker-compose'

# Vagrant
alias v="vagrant"
alias vv='cd ~/Dev/personal/vagrant/'

# Misc
alias tmux="TERM=screen-256color-bce tmux"

# Below taken from Paul Irish's (@paulirish) dotfiles (Thanks!)
# Ref: https://github.com/paulirish/dotfiles

# View HTTP traffic
alias httpdump="tcpdump -i any -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# pwgen shortcut
alias pw="pwgen -nBy -r '\"\`[],' -s 25 1"

# VMWare CloudClient
alias cloudclient='/opt/cloudclient/bin/cloudclient.sh'
