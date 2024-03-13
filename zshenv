typeset -U path # ensure unique paths within PATH
export NODE_PATH=/usr/local/lib/node_modules
export LANG=en_US.UTF-8
export EDITOR=nvim
export REMOTE_GEM_CACHE_PATH=$HOME/.remote-gem-cache
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache
export ERL_AFLAGS="-kernel shell_history enabled"

if type ag &> /dev/null; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .yarn -l -g ""'
fi

. "$HOME/.cargo/env"
