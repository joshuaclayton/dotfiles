export SVN_EDITOR=vi
export DISPLAY=:0.0
export CLICOLOR=1
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/sbin:$HOME/.homebrew/bin:$PATH"

PS1='[\u \w$(__git_ps1 " | %s")]\$ '

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

source $HOME/.zlogin

for a in `ls $HOME/.zsh_profile.d/*`; do
  source $a
done

# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

if [[ -s /Users/joshuaclayton/.rvm/scripts/rvm ]] ; then source /Users/joshuaclayton/.rvm/scripts/rvm ; fi
