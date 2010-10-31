#load all of the alias, config, and env files that are postfixed with .zsh
for source_file in $DOTFILES/zsh/*/*.zsh; do
  source $source_file
done
#load all of the functions that are postfixed with .zsh including uncatigoriezed functions
for source_file in $DOTFILES/zsh/functions/**/**.zsh(N); do
  source source_file
done