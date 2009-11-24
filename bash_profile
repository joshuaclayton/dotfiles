export SVN_EDITOR=vi
export DISPLAY=:0.0
export CLICOLOR=1
export PATH="$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH"

PS1='[\u \w$(__git_ps1 " | %s")]\$ '

for a in `ls $HOME/.bash_profile.d/*.sh`; do
  source $a
done

if [ -f ~/.rvm/bin/rvm ] ; then source ~/.rvm/bin/rvm ; fi
if [ -f ~/.rvm/current ] ; then source ~/.rvm/current ; fi
if [ -f ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
