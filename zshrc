# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd
cdpath=(. ~/dev/personal ~/dev/thoughtbot ~/dev/gems)

# use vim as an editor
export EDITOR=vim

# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward
setopt correct

source $HOME/.zlogin
source $HOME/.aliases

for a in $(ls $HOME/.zsh_profile.d/*); do
  source $a
done
