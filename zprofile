path=($HOME/.dotfiles/bin /usr/local/share/npm/bin /usr/local/Cellar/python/2.7.2/bin /usr/local/share/python /usr/local/sbin /usr/local/bin $path)
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
path=(.git/safe/../../bin .git/safe/../../bin/stubs $path)
