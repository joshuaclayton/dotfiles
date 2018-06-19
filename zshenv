typeset -U path # ensure unique paths within PATH
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8
export EDITOR=nvim
export REMOTE_GEM_CACHE_PATH=$HOME/.remote-gem-cache
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache
export INTERNET_STATUS_LOG=/tmp/internet-status.log
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/.golang"
export ERL_AFLAGS="-kernel shell_history enabled"
export ANDROID_HOME="/Users/joshuaclayton/Library/Android/sdk"

touch $INTERNET_STATUS_LOG
eval `docker-machine env 2>/dev/null`
