path=($HOME/.dotfiles/bin /usr/local/share/npm/bin /usr/local/Cellar/python/2.7.2/bin /usr/local/share/python /usr/local/sbin /usr/local/bin $path)

[[ -d $RBENV_ROOT/shims ]] && eval "$(rbenv init -)"

path=(.git/safe/../../bin .git/safe/../../bin/stubs $path)

source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

current
