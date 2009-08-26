export SVN_EDITOR=vi
export DISPLAY=:0.0
export CLICOLOR=1
export PATH="/opt/ruby-enterprise-1.8.6-20090610/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/Developer/SDKs/flex_sdk_3/bin:$PATH"

PS1='[\u \w$(__git_ps1 " | %s")]\$ '

for a in `ls $HOME/.bash_profile.d/*.sh`; do
  source $a
done
