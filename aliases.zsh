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
alias dv='cd ~/Dev'
alias dg='cd ~/Dev/git'
alias vv='cd ~/Dev/git/vagrant/'

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
alias sniff="ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# Vagrant
alias v="vagrant"

alias nand="/Applications/nand2tetris/tools/HardwareSimulator.sh &"

# AWS
alias elbs="aws elb describe-load-balancers | jq '.LoadBalancerDescriptions[] | { Instances: [.Instances[].InstanceId], LoadBalancerName }'"
alias elba="aws elb describe-load-balancers | jq '.'"
alias cf='aws cloudformation'

function regions {
    echo "AWS Regions List"
    echo "================="
    echo "  * ap-southeast-2 (Sydney)"
    echo "  * us-east-1 (N Virginia)"
    echo "  * us-west-2 (Oregon)"
    echo "  * us-west-1 (N California)"
    echo "  * eu-west-1 (Ireland)"
    echo "  * ap-southeast-1 (Singapore)"
    echo "  * ap-northeast-1 (Tokyo)"
    echo "  * sa-east-1 (Sao Paulo)"
}



function ec2 {
    aws ec2 describe-instances --instance-ids $@ | jq '.Reservations[].Instances[] | {State: .State.Name, AZ: .Placement.AvailabilityZone, KeyName, PublicDnsName, PrivateDnsName, PublicIpAddress, InstanceType, InstanceId, Tags: [.Tags[]]}'
}

function ec2s {
    aws ec2 describe-instances --filter '{"name":"instance-state-name", "values":"running"}' | jq '.Reservations[].Instances[] | {State: .State.Name, AZ: .Placement.AvailabilityZone, KeyName, PublicDnsName, PrivateDnsName, PublicIpAddress, InstanceType, InstanceId}'
}

function ss {
    echo "SSHing to root@$@"
    ssh -p 4031 root@$@
}

function ds {
    echo "Describing stack $@"
    aws cloudformation describe-stacks --stack-name $@ | jq '.'
}

function cfl {
    echo "Listing available stacks..."
    aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | jq '.'
}
