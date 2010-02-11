export SVN_EDITOR=vi
export DISPLAY=:0.0
export CLICOLOR=1
export PATH="$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/mongo/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH"

PS1='[\u \w$(__git_ps1 " | %s")]\$ '

for a in `ls $HOME/.bash_profile.d/*.sh`; do
  source $a
done
if [[ -s /Users/joshuaclayton/.rvm/scripts/rvm ]] ; then source /Users/joshuaclayton/.rvm/scripts/rvm ; fi
