autoload -U colors && colors
autoload -Uz compinit
compinit
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export EDITOR=vim

ZSH_THEME="bira"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew jrowe osx rvm)

autoload -U colors && colors

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/bin":/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:"$HOME/.vims"

alias b="bundle"
alias be="bundle exec"
alias ber="bundle exec rake"
alias beu="bundle exec unicorn -p 3000"
alias bec="bundle exec cucumber"
alias bert="bundle exec rake -T"

alias vup="vagrant up"
alias vdown="vagrant halt"
alias vst="vagrant status"

alias gst="git status"
alias gpp="git pull && git push"

function jr_git () {
  ssh jr "mkdir -p /git/$1 && cd /git/$1 && git init --bare"
  echo "ssh://jrowe@jeremyrowe.com:/git/$1"
}

[[ -s "$HOME/.tidbits/mhsrc" ]]                            && . "$HOME/.tidbits/mhsrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]]                          && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]]            && . "$HOME/.tmuxinator/scripts/tmuxinator"
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator-completion" ]] && . "$HOME/.tmuxinator/scripts/tmuxinator-completion"
