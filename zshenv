typeset -U path # ensure unique paths within PATH
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8
export RBENV_ROOT=$HOME/.rbenv

path=($HOME/.dotfiles/bin /usr/local/share/npm/bin /usr/local/Cellar/python/2.7.2/bin /usr/local/share/python /usr/local/bin $path)

[[ -d $RBENV_ROOT/shims ]] && eval "$(rbenv init -)"

path=(.git/safe/../../bin $path)
