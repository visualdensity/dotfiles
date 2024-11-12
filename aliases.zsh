# Custom cd
c() {
  cd $1;
  ls -l --color=always;
  # ls -lG; # for Mac terminals
}

alias vf='vim $(fzf)'
alias cat='batcat --theme "1337" --paging never'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

# Navigation
alias dv='cd ~/Dev'

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

alias tf='terraform'
alias mp='multipass'

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%m@%c%{$reset_color%} $(git_prompt_info)'
