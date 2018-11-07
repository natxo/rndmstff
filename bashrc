# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
 
PATH=$PATH:$HOME/bin:$HOME/perl5/bin/:/opt/bin:$HOME/npm/bin

# or no syntax on in git commit -v
export EDITOR=/usr/bin/vim

# node homedir settings
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# better bash_history
# http://blog.sanctum.geek.nz/better-bash-history/

# append by default to .bash_history
shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
# don't store empty space of duplicate commands
HISTCONTROL=ignoreboth
# record timestamps
HISTTIMEFORMAT='%F %T '
# one command per line
shopt -s cmdhist

# store history inmediately
PROMPT_COMMAND='history -a'

# User specific aliases and functions

alias ls='ls --color=auto'
#    alias grep='grep --colour=always -Hir'
#    alias rdesktop='rdesktop -g 1280x1024 -u jose.admin -d iriszorg'

# xscreensaveer bash completion
complete -W "-exit -demo -activate -deactivate -version -lock" xscreensaver-command 

# wireshark ssl
# https://jimshaver.net/2015/02/11/decrypting-tls-browser-traffic-with-wireshark-the-easy-way/
export SSLKEYLOGFILE=~/wireshark/sslkeylog.log

#export NNTPSERVER='free.xsusenet.com'

export PERL5LIB=~/perl5/lib/perl5
export GOPATH=~/go
export PATH=/home/natxo/rakudo-star-2017.10/install/bin/:/home/natxo/rakudo-star-2017.10/install/share/perl6/site/bin:$PATH
