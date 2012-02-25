typeset -U path # ensure unique paths within PATH
path=($HOME/.dotfiles/bin $HOME/.rbenv/bin /usr/local/Cellar/python/2.7.1/bin /usr/local/bin $path)
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8

if [[ -x "rbenv" ]]; then
  eval "$(rbenv init -)"
fi
