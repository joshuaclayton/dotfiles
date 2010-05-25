export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/sbin:$HOME/.homebrew/bin:$PATH"

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

source $HOME/.zlogin
source $HOME/.aliases

for a in $(ls $HOME/.zsh_profile.d/*); do
  source $a
done

# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
