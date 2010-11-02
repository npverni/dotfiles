export ZSH_THEME="candy"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(brew osx git textmate rails ruby)
export RPROMPT="\$(rvm_prompt_info)"
