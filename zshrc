export REMOTE_GEM_CACHE_PATH=$HOME/.remote-gem-cache
export ZSH_HISTORY_PATH=$HOME/.zsh_history

source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.zsh_profile.d/rvm
source $HOME/.zsh_profile.d/cd_to_last_directory
