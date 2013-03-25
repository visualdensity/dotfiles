# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

# Navigation
alias www='cd /var/www/vhosts'

# Symfony specific
alias sf='php app/console'

# Misc
alias afind='ack-grep -il'
alias tmux="TERM=screen-256color-bce tmux"

# Below taken from Paul Irish's (@paulirish) dotfiles (Thanks!)
# Ref: https://github.com/paulirish/dotfiles

# Requires: http://pygments.org/
alias c='pygmentize -O style=monokai -f console256 -g'

# List only directories
alias lsd='ls -l | grep "^d"'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""
