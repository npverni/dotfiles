c() { cd "$HOME/code/$1"; }
_c() { _files -W "$HOME/code" -/; }
compdef _c c

mhs() { cd "$HOME/code/mhs/$1"; }
_mhs() { _files -W "$HOME/code/mhs" -/; }
compdef _mhs mhs

os() { cd "$HOME/code/opensource/$1"; }
_os() { _files -W "$HOME/code/opensource" -/; }
compdef _os os

personal() { cd "$HOME/code/personal/$1"; }
_personal() { _files -W "$HOME/code/personal" -/; }
compdef _personal personal

design() { cd "$HOME/design/$1"; }
_design() { _files -W "$HOME/design" -/; }
compdef _design design

t() { tmuxinator "$1"; }
_t() { ls "$HOME/.tmuxinator" | sed 's@.yml@@g' ; }
compdef _t t
