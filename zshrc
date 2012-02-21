autoload -U colors && colors
autoload -Uz compinit
compinit
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

EDITOR=vim

ZSH_THEME="bira"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew jrowe osx rvm)

autoload -U colors && colors

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/bin":/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:"$HOME/.vims"

# IBM CONFIGURATION FOR SIEBEL
export IBM_TIVOLI_TOOLS_PATH="/Users/jrowe/vms/ibm/tivoli"
export IBM_GSA_PATH="/Users/jrowe/vms/ibm/gsa"

alias b="bundle"
alias be="bundle exec"
alias ber="bundle exec rake"
alias bec="bundle exec cucumber"
alias bert="bundle exec rake -T"

alias vup="vagrant up"
alias vdown="vagrant halt"
alias vst="vagrant status"

function ad () {
  ~/.tidbits/lib/aliasdir.rb $@
  eval `~/.tidbits/lib/aliasdir.rb --dump`
}
eval `~/.tidbits/lib/aliasdir.rb --dump`

function al () {
  eval $1
}

function jr_git () {
  ssh jr "mkdir -p /git/$1 && cd /git/$1 && git init --bare"
  echo "ssh://jrowe@jeremyrowe.com:/git/$1"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
