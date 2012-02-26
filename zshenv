typeset -U path # ensure unique paths within PATH
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8
export RBENV_ROOT=$HOME/.rbenv

path=($RBENV_ROOT/bin $HOME/.dotfiles/bin /usr/local/Cellar/python/2.7.1/bin /usr/local/bin $path)

if [[ -d $RBENV_ROOT/bin ]]; then
  eval "$(rbenv init -)"
fi
