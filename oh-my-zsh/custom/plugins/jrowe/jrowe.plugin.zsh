c() { cd "$HOME/code/$1"; }
_c() { _files -W "$HOME/code" -/; }
compdef _c c

m() { cd "$HOME/code/mhs/$1"; }
_m() { _files -W "$HOME/code/mhs" -/; }
compdef _m m

os() { cd "$HOME/code/opensource/$1"; }
_os() { _files -W "$HOME/code/opensource" -/; }
compdef _os os

p() { cd "$HOME/code/personal/$1"; }
_p() { _files -W "$HOME/code/personal" -/; }
compdef _p p

design() { cd "$HOME/design/$1"; }
_design() { _files -W "$HOME/design" -/; }
compdef _design design

