source $HOME/.aliasrc

export REMOTE_GEM_CACHE_PATH=$HOME/.remote-gem-cache
export CURRENT_PROJECT_PATH=$HOME/.current-project
export ZSH_HISTORY_PATH=$HOME/.zsh_history

for zsh_source in $HOME/.zsh_profile.d/*; do
  source $zsh_source
done
