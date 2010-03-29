export SVN_EDITOR=vi
export DISPLAY=:0.0
export CLICOLOR=1
export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/sbin:$HOME/.homebrew/bin:$PATH"

PS1='[\u \w$(__git_ps1 " | %s")]\$ '

for a in `ls $HOME/.bash_profile.d/*.sh`; do
  source $a
done
if [[ -s /Users/joshuaclayton/.rvm/scripts/rvm ]] ; then source /Users/joshuaclayton/.rvm/scripts/rvm ; fi
