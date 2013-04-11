typeset -U path # ensure unique paths within PATH
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8

path=($HOME/.dotfiles/bin /usr/local/share/npm/bin /usr/local/Cellar/python/2.7.2/bin /usr/local/share/python /usr/local/sbin /usr/local/bin $path)
path=(.git/safe/../../bin .git/safe/../../bin/stubs $path)
