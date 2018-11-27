# Custom cd
c() {
  cd $1;
  ls -l --color=always;
}
alias cd="c"
alias vf='vim $(fzf)'
alias cat='bat --theme "1337" --paging never'

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
alias dvi='cd ~/Dev/iflix'

#Docker
alias dk='docker'
alias dkr='docker run'
alias dkv='docker volume ls'
alias dkps='docker ps -a'
alias dkrm='docker ps -a --format "{{.ID}}" | xargs docker rm -v'
alias dcm='docker-compose'

# K8s
alias k="kubectl"
alias ko="kubectl -o wide"

# Vagrant
alias v="vagrant"
alias vv='cd ~/Dev/personal/vagrant/'

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tm='tmux'

# Below taken from Paul Irish's (@paulirish) dotfiles (Thanks!)
# Ref: https://github.com/paulirish/dotfiles

# View HTTP traffic
alias httpdump="tcpdump -i any -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# pwgen shortcut
alias pw="pwgen -nBy -r '\"\`[],' -s 25 1"


################ KEYBINDINGS ################
# Too lazy to move it to keybindings file
# Source: https://github.com/Parth/dotfiles
#############################################
# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

if [[ -a $ZSH/lib/prompt.sh ]]; then
  source $ZSH/lib/prompt.sh
fi

alias sta='saml2aws login --profile iflix-okta'
alias gg='cd ~/go/src/github.com/'
